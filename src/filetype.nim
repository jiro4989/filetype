import filetype/[types, image, archive, audio, font, video]
export types

proc match*(buf: openArray[byte]): FileType =
  ## Returns a file type from matched magic number.
  ## Returns a empty `FileType` if `buf` was not matched any matchers.
  runnableExamples:
    var buf: seq[byte]
    doAssert buf.match() == FileType()

    from filetype/image import typeGif
    doAssert @['G'.byte, 'I'.byte, 'F'.byte, '8'.byte, '7'.byte, 'a'.byte].match() == typeGif
  const allMatchers = @[imageMatcher, archiveMatcher, audioMatcher, fontMatcher, videoMatcher]
  for matchers in allMatchers:
    for matcher in matchers:
      let matchFunc = matcher[1]
      if buf.matchFunc:
        return matcher[0]

when not defined js:
  import streams
  from os import getFileSize
  from sequtils import newSeqWith

  proc matchFile*(file: string): FileType =
    ## Returns a file type from matched magic number.
    ## `file` is a file path.
    ##
    ## **Note:** Not available for JS backend.
    const maxSize = 1024
    let fileSize = file.getFileSize()
    let size =
      if fileSize < maxSize: fileSize.int
      else: maxSize

    var strm = openFileStream(file)
    defer: strm.close()
    var buf = newSeqWith(size.int, 0'u8)
    for i in 0..<size:
      buf[i] = strm.readUint8()
    return buf.match()
