import filetype/[types, image, archive, audio, font, video]
export types, image, archive, audio, font, video

const allMatchers = @[imageMatcher, archiveMatcher, audioMatcher, fontMatcher, videoMatcher]

proc match*(buf: openArray[byte]): FileType =
  ## Returns a file type from matched magic number.
  ## Returns a empty `FileType` if `buf` was not matched any matchers.
  runnableExamples:
    var buf: seq[byte]
    doAssert buf.match() == FileType()

    from filetype/image import typeGif
    doAssert @['G'.byte, 'I'.byte, 'F'.byte, '8'.byte, '7'.byte,
        'a'.byte].match() == typeGif
  for matchers in allMatchers:
    for matcher in matchers:
      let matchFunc = matcher[1]
      if buf.matchFunc:
        return matcher[0]

when not defined js:
  import filetype/private/util
  from os import fileExists

  proc matchFile*(file: string): FileType =
    ## Returns a file type from matched magic number.
    ## `file` is a file path.
    ##
    ## **Note:** Not available for JS backend.
    if not fileExists(file): return
    return readMagicNubmer(file).match()
