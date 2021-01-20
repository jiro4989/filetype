import unittest, os

include filetype

const
  testDataDir = "tests"/"testdata"

func sampleFile(ext: string): string =
  return testDataDir/"sample." & ext

suite "proc matchFile":
  # image
  test "image: jpg": check matchFile(sampleFile("jpg")).mime.value == "image/jpeg"
  test "image: jpeg": check matchFile(sampleFile("jpeg")).mime.value == "image/jpeg"
  test "image: png": check matchFile(sampleFile("png")).mime.value == "image/png"
  test "image: gif": check matchFile(sampleFile("gif")).mime.value == "image/gif"
  test "image: webp": check matchFile(sampleFile("webp")).mime.value == "image/webp"
  test "image: tiff": check matchFile(sampleFile("tiff")).mime.value == "image/tiff"
  test "image: bmp": check matchFile(sampleFile("bmp")).mime.value == "image/bmp"
  test "image: psd": check matchFile(sampleFile("psd")).mime.value == "image/vnd.adobe.photoshop"
  test "image: ico": check matchFile(sampleFile("ico")).mime.value == "image/vnd.microsoft.icon"
  # archive
  test "archive: gzip": check matchFile(sampleFile("gz")).mime.value == "application/gzip"
  test "archive: zip": check matchFile(sampleFile("zip")).mime.value == "application/zip"
  test "archive: bzip2": check matchFile(sampleFile("bz2")).mime.value == "application/x-bzip2"
  test "archive: 7z": check matchFile(sampleFile("7z")).mime.value == "application/x-7z-compressed"
  test "archive: pdf": check matchFile(sampleFile("pdf")).mime.value == "application/pdf"
  test "archive: exe": check matchFile(sampleFile("exe")).mime.value == "application/vnd.microsoft.portable-executable"
  test "archive: ps": check matchFile(sampleFile("ps")).mime.value == "application/postscript"
  # audio
  test "audio/midi": check matchFile(sampleFile("mid")).mime.value == "audio/midi"
  test "audio/wav": check matchFile(sampleFile("wav")).mime.value == "audio/x-wav"
