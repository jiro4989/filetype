import types, private/util

const
  typeMidi* = newFileType("audio/midi", "mid")
  typeMp3* = newFileType("audio/mpeg", "mp3")
  typeM4a* = newFileType("audio/m4a", "m4a")
  typeOgg* = newFileType("audio/ogg", "ogg")
  typeFlac* = newFileType("audio/x-flac", "flac")
  typeWav* = newFileType("audio/x-wav", "wav")
  typeAmr* = newFileType("audio/amr", "amr")
  typeAac* = newFileType("audio/aac", "aac")

  magicNumberMidi = @[0x4d'u8, 0x54, 0x68, 0x64]
  magicNumberOgg = @[0x4f'u8, 0x67, 0x67, 0x53]
  magicNumberFlac = @[0x66'u8, 0x4c, 0x61, 0x43]
  magicNumberAmr = @[0x23'u8, 0x21, 0x41, 0x4d, 0x52, 0x0a]

func isMp3*(buf: openArray[byte]): bool =
  checkMagicNumber(buf, @[0x49'u8, 0x44, 0x33]) or checkMagicNumber(buf, @[0xff'u8, 0xfb])
generateFileFunc Mp3

func isAac*(buf: openArray[byte]): bool =
  checkMagicNumber(buf, @[0xff'u8, 0xf1]) or checkMagicNumber(buf, @[0xff'u8, 0xf9])
generateFileFunc Aac

func isWav*(buf: openArray[byte]): bool =
  #magicNumberWav = @[0x52'u8, 0x49, 0x46, 0x46, 0x57, 0x41, 0x56, 0x45]
  if 11 < buf.len:
    return buf[0] == 0x52'u8 and
           buf[1] == 0x49'u8 and
           buf[2] == 0x46'u8 and
           buf[3] == 0x46'u8 and
           buf[8] == 0x57'u8 and
           buf[9] == 0x41'u8 and
           buf[10] == 0x56'u8 and
           buf[11] == 0x45'u8
generateFileFunc Wav

generateFunc Midi
generateFunc Ogg
generateFunc Flac
generateFunc Amr

const
  audioMatcher* = @[
    (typeMidi, isMidi),
    (typeOgg, isOgg),
    (typeFlac, isFlac),
    (typeWav, isWav),
    (typeAmr, isAmr),
    (typeMp3, isMp3),
    (typeAac, isAac),
  ]

