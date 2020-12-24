import filetype/[types, image]
export types

proc match*(buf: seq[byte]): FileType =
  discard
