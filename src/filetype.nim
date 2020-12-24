type
  FileType* = object
    Mime*: MIME
    Extension*: string
  MIME* = object
    Mime*: string
    SubType*: string
    Value*: string

proc match*(buf: seq[byte]): FileType =
  discard
