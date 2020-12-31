import strutils

type
  FileType* = object
    mime*: Mime
    extension*: string ## File extension. (ex: `zip`)
  Mime* = object
    ## MIME type.
    typ*: string     ## Ex: `application` of `application/gzip`.
    subType*: string ## Ex: `gzip` of `application/gzip`.
    value*: string   ## Ex: `application/gzip` of `application/gzip`.

func newFileType*(mime, ext: string): FileType =
  let s = mime.split("/")
  let mime2 =
    if 2 <= s.len:
      Mime(typ: s[0], subType: s[1], value: mime)
    else:
      Mime(typ: s[0], subType: "", value: mime)

  result.mime = mime2
  result.extension = ext
