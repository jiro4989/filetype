## * https://en.wikipedia.org/wiki/JPEG ff d8 ff
## * https://en.wikipedia.org/wiki/Portable_Network_Graphics 89 50 4e 47 0d 0a 1a 0a
## * https://en.wikipedia.org/wiki/GIF "GIF87a/GIF89a"
## * https://en.wikipedia.org/wiki/BMP_file_format "BM"
## * https://en.wikipedia.org/wiki/JPEG_XR 

import types, private/util

const
  typeJpeg* = newFileType("image/jpeg", "jpg")
  typeJpeg2000* = newFileType("image/jp2", "jp2")
  typePng* = newFileType("image/png", "png")
  typeGif* = newFileType("image/gif", "gif")
  typeWebp* = newFileType("image/webp", "webp")
  typeCr2* = newFileType("image/x-canon-cr2", "cr2")
  typeTiff* = newFileType("image/tiff", "tif")
  typeBmp* = newFileType("image/bmp", "bmp")
  typeJxr* = newFileType("image/vnd.ms-photo", "jxr")
  typePsd* = newFileType("image/vnd.adobe.photoshop", "psd")
  typeIco* = newFileType("image/vnd.microsoft.icon", "ico")
  typeHeif* = newFileType("image/heif", "heif")
  typeDwg* = newFileType("image/vnd.dwg", "dwg")

  magicNumberJpeg = @[0xff'u8, 0xd8, 0xff]
  magicNumberPng = @[0x89'u8, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a]
  magicNumberGif87a = str2Bytes("GIF87a")
  magicNumberGif89a = str2Bytes("GIF89a")
  magicNumberBmp = str2Bytes("BM")
  magicNumberJxr = @[0x49'u8, 0x49, 0xbc]
  magicNumberPsd = @[0x38'u8, 0x42, 0x50, 0x53]
  magicNumberIco = @[0x00'u8, 0x00, 0x01, 0x00]
  magicNumberDwg = @[0x41'u8, 0x43, 0x31, 0x30]

generateFunc Jpeg
generateFunc Png
generateFunc Bmp
generateFunc Jxr
generateFunc Psd
generateFunc Ico
generateFunc Dwg

func isGif*(buf: openArray[byte]): bool =
  checkMagicNumber(buf, magicNumberGif87a) or checkMagicNumber(buf, magicNumberGif89a)

const
  imageMatcher* = @[
    (typeJpeg, isJpeg),
    (typePng, isPng),
    (typeBmp, isBmp),
    (typeJxr, isJxr),
    (typePsd, isPsd),
    (typeIco, isIco),
    (typeDwg, isDwg),
    (typeGif, isGif),
  ]

