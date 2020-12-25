import filetype/[types, image]
export types

proc match*(buf: openArray[byte]): FileType =
  for matcher in imageMatcher:
    let matchFunc = matcher[1]
    if buf.matchFunc:
      return matcher[0]

when not defined js:
  import streams

  proc matchFile*(file: string): FileType =
    var strm = openFileStream(file)
    defer: strm.close()
    var buf: array[20, byte]
    strm.read(buf)
    return buf.match()
