import types
import private/util

const
  typeMp4* = newFileType("video/mp4", "mp4")
  typeM4v* = newFileType("video/x-m4v", "m4v")
  typeMkv* = newFileType("video/x-matroska", "mkv")
  typeWebm* = newFileType("video/webm", "webm")
  typeMov* = newFileType("video/quicktime", "mov")
  typeAvi* = newFileType("video/x-msvideo", "avi")
  typeWmv* = newFileType("video/x-ms-wmv", "wmv")
  typeMpeg* = newFileType("video/mpeg", "mpg")
  typeFlv* = newFileType("video/x-flv", "flv")
  type3gp* = newFileType("video/3gpp", "3gp")

  magicNumberWmv = @[0x30'u8, 0x26, 0xb2, 0x75, 0x8e, 0x66, 0xcf, 0x11, 0xa6, 0xd9]
  magicNumberFlv = @[0x46'u8, 0x4c, 0x56, 0x01]

generateFunc Wmv
generateFunc Flv

func isAvi*(buf: openArray[byte]): bool =
  return 10 < buf.len and
    buf[0] == 0x52 and
    buf[1] == 0x49 and
    buf[2] == 0x46 and
    buf[3] == 0x46 and
    buf[8] == 0x41 and
    buf[9] == 0x56 and
    buf[10] == 0x49
generateFileFunc Avi

func isMpeg*(buf: openArray[byte]): bool =
  return 3 < buf.len and
    buf[0] == 0x0 and buf[1] == 0x0 and
    buf[2] == 0x1 and buf[3] >= 0xb0 and
    buf[3] <= 0xbf
generateFileFunc Mpeg

func isMp4*(buf: openArray[byte]): bool =
  return 11 < buf.len and
    (buf[4] == 'f'.byte and buf[5] == 't'.byte and buf[6] == 'y'.byte and buf[
        7] == 'p'.byte) and
    ((buf[8] == 'a'.byte and buf[9] == 'v'.byte and buf[10] == 'c'.byte and buf[
        11] == '1'.byte) or
      (buf[8] == 'd'.byte and buf[9] == 'a'.byte and buf[10] == 's'.byte and
          buf[11] == 'h'.byte) or
      (buf[8] == 'i'.byte and buf[9] == 's'.byte and buf[10] == 'o'.byte and
          buf[11] == '2'.byte) or
      (buf[8] == 'i'.byte and buf[9] == 's'.byte and buf[10] == 'o'.byte and
          buf[11] == '3'.byte) or
      (buf[8] == 'i'.byte and buf[9] == 's'.byte and buf[10] == 'o'.byte and
          buf[11] == '4'.byte) or
      (buf[8] == 'i'.byte and buf[9] == 's'.byte and buf[10] == 'o'.byte and
          buf[11] == '5'.byte) or
      (buf[8] == 'i'.byte and buf[9] == 's'.byte and buf[10] == 'o'.byte and
          buf[11] == '6'.byte) or
      (buf[8] == 'i'.byte and buf[9] == 's'.byte and buf[10] == 'o'.byte and
          buf[11] == 'm'.byte) or
      (buf[8] == 'm'.byte and buf[9] == 'm'.byte and buf[10] == 'p'.byte and
          buf[11] == '4'.byte) or
      (buf[8] == 'm'.byte and buf[9] == 'p'.byte and buf[10] == '4'.byte and
          buf[11] == '1'.byte) or
      (buf[8] == 'm'.byte and buf[9] == 'p'.byte and buf[10] == '4'.byte and
          buf[11] == '2'.byte) or
      (buf[8] == 'm'.byte and buf[9] == 'p'.byte and buf[10] == '4'.byte and
          buf[11] == 'v'.byte) or
      (buf[8] == 'm'.byte and buf[9] == 'p'.byte and buf[10] == '7'.byte and
          buf[11] == '1'.byte) or
      (buf[8] == 'M'.byte and buf[9] == 'S'.byte and buf[10] == 'N'.byte and
          buf[11] == 'V'.byte) or
      (buf[8] == 'N'.byte and buf[9] == 'D'.byte and buf[10] == 'A'.byte and
          buf[11] == 'S'.byte) or
      (buf[8] == 'N'.byte and buf[9] == 'D'.byte and buf[10] == 'S'.byte and
          buf[11] == 'C'.byte) or
      (buf[8] == 'N'.byte and buf[9] == 'S'.byte and buf[10] == 'D'.byte and
          buf[11] == 'C'.byte) or
      (buf[8] == 'N'.byte and buf[9] == 'D'.byte and buf[10] == 'S'.byte and
          buf[11] == 'H'.byte) or
      (buf[8] == 'N'.byte and buf[9] == 'D'.byte and buf[10] == 'S'.byte and
          buf[11] == 'M'.byte) or
      (buf[8] == 'N'.byte and buf[9] == 'D'.byte and buf[10] == 'S'.byte and
          buf[11] == 'P'.byte) or
      (buf[8] == 'N'.byte and buf[9] == 'D'.byte and buf[10] == 'S'.byte and
          buf[11] == 'S'.byte) or
      (buf[8] == 'N'.byte and buf[9] == 'D'.byte and buf[10] == 'X'.byte and
          buf[11] == 'C'.byte) or
      (buf[8] == 'N'.byte and buf[9] == 'D'.byte and buf[10] == 'X'.byte and
          buf[11] == 'H'.byte) or
      (buf[8] == 'N'.byte and buf[9] == 'D'.byte and buf[10] == 'X'.byte and
          buf[11] == 'M'.byte) or
      (buf[8] == 'N'.byte and buf[9] == 'D'.byte and buf[10] == 'X'.byte and
          buf[11] == 'P'.byte) or
      (buf[8] == 'N'.byte and buf[9] == 'D'.byte and buf[10] == 'X'.byte and
          buf[11] == 'S'.byte) or
      (buf[8] == 'F'.byte and buf[9] == '4'.byte and buf[10] == 'V'.byte and
          buf[11] == ' '.byte) or
      (buf[8] == 'F'.byte and buf[9] == '4'.byte and buf[10] == 'P'.byte and
          buf[11] == ' '.byte))
generateFileFunc Mp4

const
  videoMatcher* = @[
    (typeWmv, isWmv),
    (typeFlv, isFlv),
    (typeAvi, isAvi),
    (typeMpeg, isMpeg),
    (typeMp4, isMp4),
  ]
