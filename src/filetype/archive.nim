import types, private/util

const
  typeEpub* = newFileType("application/epub+zip", "epub")
  typeZip* = newFileType("application/zip", "zip")
  typeTar* = newFileType("application/x-tar", "tar")
  typeRar* = newFileType("application/vnd.rar", "rar")
  typeGz* = newFileType("application/gzip", "gz")
  typeBz2* = newFileType("application/x-bzip2", "bz2")
  type7z* = newFileType("application/x-7z-compressed", "7z")
  typeXz* = newFileType("application/x-xz", "xz")
  typePdf* = newFileType("application/pdf", "pdf")
  typeExe* = newFileType("application/vnd.microsoft.portable-executable", "exe")
  typeSwf* = newFileType("application/x-shockwave-flash", "swf")
  typeRtf* = newFileType("application/rtf", "rtf")
  typeEot* = newFileType("application/octet-stream", "eot")
  typePs* = newFileType("application/postscript", "ps")
  typeSqlite* = newFileType("application/vnd.sqlite3", "sqlite")
  typeNes* = newFileType("application/x-nintendo-nes-rom", "nes")
  typeCrx* = newFileType("application/x-google-chrome-extension", "crx")
  typeCab* = newFileType("application/vnd.ms-cab-compressed", "cab")
  typeDeb* = newFileType("application/vnd.debian.binary-package", "deb")
  typeAr* = newFileType("application/x-unix-archive", "ar")
  typeZ* = newFileType("application/x-compress", "Z")
  typeLz* = newFileType("application/x-lzip", "lz")
  typeRpm* = newFileType("application/x-rpm", "rpm")
  typeElf* = newFileType("application/x-executable", "elf")
  typeDcm* = newFileType("application/dicom", "dcm")
  typeIso* = newFileType("application/x-iso9660-image", "iso")
  typeMachO* = newFileType("application/x-mach-binary", "macho")

  magicNumberGz = @[0x1f'u8, 0x8b, 0x8]
  magicNumberBz2 = @[0x42'u8, 0x5a, 0x68]
  magicNumber7z = @[0x37'u8, 0x7a, 0xbc, 0xaf, 0x27, 0x1c]
  magicNumberPdf = @[0x25'u8, 0x50, 0x44, 0x46]
  magicNumberExe = @[0x4d'u8, 0x5a]
  magicNumberRtf = @[0x7b'u8, 0x5c, 0x72, 0x74, 0x66]
  magicNumberNes = @[0x4e'u8, 0x45, 0x53, 0x1a]
  magicNumberCrx = @[0x43'u8, 0x72, 0x32, 0x34]
  magicNumberPs = @[0x25'u8, 0x21]
  magicNumberXz = @[0xfd'u8, 0x37, 0x7a, 0x58, 0x5a, 0x00]
  magicNumberSqlite = @[0x53'u8, 0x51, 0x4c, 0x69]
  magicNumberDeb = @[0x21'u8, 0x3C, 0x61, 0x72, 0x63, 0x68, 0x3E, 0x0A, 0x64, 0x65, 0x62, 0x69, 0x61, 0x6E, 0x2D, 0x62, 0x69, 0x6E, 0x61, 0x72, 0x79]
  magicNumberAr = @[0x21'u8, 0x3c, 0x61, 0x72, 0x63, 0x68, 0x3e]
  magicNumberLz = @[0x4c'u8, 0x5a, 0x49, 0x50]
  magicNumberRpm = @[0xed'u8, 0xab, 0xee, 0xdb]
  magicNumberElf = @[0x7f'u8, 0x45, 0x4c, 0x46]

generateFunc Gz
generateFunc Bz2
generateFunc "7z"
generateFunc Pdf
generateFunc Exe
generateFunc Rtf
generateFunc Nes
generateFunc Crx
generateFunc Ps
generateFunc Xz
generateFunc Sqlite
generateFunc Deb
generateFunc Ar
generateFunc Lz
generateFunc Rpm
generateFunc Elf

func isZip*(buf: openArray[byte]): bool =
  if 3 < buf.len:
    return buf[0] == 0x50'u8 and
           buf[1] == 0x4b'u8 and
           buf[2] in @[0x3'u8, 0x5, 0x7] and
           buf[3] in @[0x4'u8, 0x6, 0x8]

const
  archiveMatcher* = @[
    (typeGz, isGz),
    (typeZip, isZip),
    (typeBz2, isBz2),
    (type7z, is7z),
    (typePdf, isPdf),
    (typeExe, isExe),
    (typeRtf, isRtf),
    (typeNes, isNes),
    (typeCrx, isCrx),
    (typePs, isPs),
    (typeXz, isXz),
    (typeSqlite, isSqlite),
    (typeDeb, isDeb),
    (typeAr, isAr),
    (typeLz, isLz),
    (typeRpm, isRpm),
    (typeElf, isElf),
  ]

