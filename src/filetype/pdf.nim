import types, private/util

const
  typePdf* = newFileType("application/pdf", "pdf")
  magicNumberPdf = @[0x25'u8, 0x50, 0x44, 0x46, 0x2D]

generateFunc Pdf

func isPdf*(buf: openArray[byte]): bool =
  checkMagicNumber(buf, magicNumberPdf) or checkMagicNumber(buf, magicNumberPdf)
generateFileFunc Pdf

const
  pdfMatcher* = @[(typePdf, isPdf)]
