import filetype/[types, image, archive, audio, font, video]
export types

proc match*(buf: openArray[byte]): FileType =
  ## Returns a file type from matched magic number.
  ## Returns `typeUnknown <./filetype/types.html#typeUnknown>`_ if `buf` was not
  ## matched all matchers.
  const allMatchers = @[imageMatcher, archiveMatcher, audioMatcher, fontMatcher, videoMatcher]
  for matchers in allMatchers:
    for matcher in matchers:
      let matchFunc = matcher[1]
      if buf.matchFunc:
        return matcher[0]
  return typeUnknown

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
