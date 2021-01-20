import unittest, os

include filetype

const
  testDataDir = "tests"/"testdata"

func sampleFile(ext: string): string =
  return testDataDir/"sample." & ext

proc checkFile(ext, mime: string) =
  check matchFile(sampleFile(ext)).mime.value == mime

suite "proc matchFile":
  # image
  test "image: jpg": checkFile("jpg", "image/jpeg")
  test "image: jpeg": checkFile("jpeg", "image/jpeg")
  test "image: png": checkFile("png", "image/png")
  test "image: gif": checkFile("gif", "image/gif")
  test "image: webp": checkFile("webp", "image/webp")
  test "image: tiff": checkFile("tiff", "image/tiff")
  test "image: bmp": checkFile("bmp", "image/bmp")
  test "image: psd": checkFile("psd", "image/vnd.adobe.photoshop")
  test "image: ico": checkFile("ico", "image/vnd.microsoft.icon")
  # archive
  test "archive: gzip": checkFile("gz", "application/gzip")
  test "archive: zip": checkFile("zip", "application/zip")
  test "archive: bzip2": checkFile("bz2", "application/x-bzip2")
  test "archive: 7z": checkFile("7z", "application/x-7z-compressed")
  test "archive: pdf": checkFile("pdf", "application/pdf")
  test "archive: exe": checkFile("exe", "application/vnd.microsoft.portable-executable")
  test "archive: ps": checkFile("ps", "application/postscript")
  # audio
  test "audio/midi": checkFile("mid", "audio/midi")
  test "audio/wav": checkFile("wav", "audio/x-wav")
