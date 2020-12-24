import filetype/[types, image]
export types

proc match*(buf: seq[byte]): FileType =
  for matcher in imageMatcher:
    let matchFunc = matcher[1]
    if buf.matchFunc:
      return matcher[0]
