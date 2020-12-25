import filetype/[types, image]
export types

proc match*(buf: openArray[byte]): FileType =
  ## Returns a file type from matched magic number.
  for matcher in imageMatcher:
    let matchFunc = matcher[1]
    if buf.matchFunc:
      return matcher[0]

when not defined js:
  import streams

  proc matchFile*(file: string): FileType =
    ## Returns a file type from matched magic number.
    ## `file` is a file path.
    ##
    ## **Note:** Not available for JS backend.
    var strm = openFileStream(file)
    defer: strm.close()
    var buf: array[20, byte]
    strm.read(buf)
    return buf.match()
