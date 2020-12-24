from sequtils import toSeq, mapIt

func checkMagicNumber*(buf, magicNumber: seq[byte]): bool =
  if magicNumber.len <= buf.len:
    let pref = buf[0..<magicNumber.len]
    return pref == magicNumber

func str2Bytes*(s: string): seq[byte] =
  toSeq(s.items).mapIt(it.byte)
