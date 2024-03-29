from std/sequtils import toSeq, mapIt, newSeqWith
import std/macros
import std/strformat

func checkMagicNumber*(buf, magicNumber: openArray[byte]): bool =
  if magicNumber.len <= buf.len:
    let pref = buf[0..<magicNumber.len]
    return pref == magicNumber

func str2Bytes*(s: string): seq[byte] =
  toSeq(s.items).mapIt(it.byte)

when not defined js:
  import std/streams
  from std/os import getFileSize, fileExists

  proc readMagicNubmer*(file: string): seq[byte] =
    if not fileExists(file): return

    const maxSize = 1024
    let fileSize = file.getFileSize()
    let size =
      if fileSize < maxSize: fileSize.int
      else: maxSize

    var strm = openFileStream(file)
    defer: strm.close()
    var buf = newSeqWith(size, 0'u8)
    for i in 0..<size:
      buf[i] = strm.readUint8()
    return buf

macro generateFunc*(format: untyped): untyped =
  let
    funcName = newIdentNode("is" & $format)
    constName = newIdentNode("magicNumber" & $format)
    arg = newIdentNode("buf")
    comment = newCommentStmtNode(&"Returns `buf` matches {format} format magic number.")

    readFileFuncName = newIdentNode("is" & $format & "File")
    fileArg = newIdentNode("file")
    fileComment = newCommentStmtNode(&"Returns that the `file` is {format} format file or not.\n\n**Note:** Not available for JS backend.")

  quote do:
    func `funcName`*(`arg`: openArray[byte]): bool =
      `comment`
      checkMagicNumber(`arg`, `constName`)

    when not defined js:
      proc `readFileFuncName`*(`fileArg`: string): bool =
        `fileComment`
        readMagicNubmer(`fileArg`).`funcName`()

macro generateFileFunc*(format: untyped): untyped =
  let
    funcName = newIdentNode("is" & $format)
    readFileFuncName = newIdentNode("is" & $format & "File")
    fileArg = newIdentNode("file")
    fileComment = newCommentStmtNode(&"Returns that the `file` is {format} format file or not.\n\n**Note:** Not available for JS backend.")

  quote do:
    when not defined js:
      proc `readFileFuncName`*(`fileArg`: string): bool =
        `fileComment`
        readMagicNubmer(`fileArg`).`funcName`()
