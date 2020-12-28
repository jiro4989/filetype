import types, util

const
  typeWoff*  = newFileType("application/font-woff", "woff")
  typeWoff2* = newFileType("application/font-woff", "woff2")
  typeTtf*   = newFileType("application/font-sfnt", "ttf")
  typeOtf*   = newFileType("application/font-sfnt", "otf")

  magicNumberWoff = @[0x77'u8, 0x4f, 0x46, 0x46, 0x00, 0x01, 0x00, 0x00]
  magicNumberWoff2 = @[0x77'u8, 0x4f, 0x46, 0x32, 0x00, 0x01, 0x00, 0x00]
  magicNumberTtf = @[0x00'u8, 0x01, 0x00, 0x00, 0x00]
  magicNumberOtf = @[0x4f'u8, 0x54, 0x54, 0x4f, 0x00]

genIsFormatFunc Woff
genIsFormatFunc Woff2
genIsFormatFunc Ttf
genIsFormatFunc Otf

const
  fontMatcher* = @[
    (typeWoff, isWoff),
    (typeWoff2, isWoff2),
    (typeTtf, isTtf),
    (typeOtf, isOtf),
  ]

