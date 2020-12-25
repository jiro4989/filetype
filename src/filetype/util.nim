from sequtils import toSeq, mapIt
import macros, strformat

func checkMagicNumber*(buf, magicNumber: openArray[byte]): bool =
  if magicNumber.len <= buf.len:
    let pref = buf[0..<magicNumber.len]
    return pref == magicNumber

func str2Bytes*(s: string): seq[byte] =
  toSeq(s.items).mapIt(it.byte)

macro genIsFormatFunc*(format: untyped): untyped =
  let funcName = newIdentNode("is" & $format)
  let constName = newIdentNode("magicNumber" & $format)
  let arg = newIdentNode("buf")
  let comment = newCommentStmtNode(&"Returns `buf` matches {format} image format magic number.")
  quote do:
    func `funcName`*(`arg`: openArray[byte]): bool =
      `comment`
      checkMagicNumber(`arg`, `constName`)

