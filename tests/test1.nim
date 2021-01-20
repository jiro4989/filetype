import unittest, os

include filetype

const
  testDataDir = "tests"/"testdata"

func sampleFile(ext: string): string =
  return testDataDir/"sample." & ext

suite "proc matchFile":
  # image
  test "jpg": check matchFile(sampleFile("jpg")).mime.value == "image/jpeg"
  test "jpeg": check matchFile(sampleFile("jpeg")).mime.value == "image/jpeg"
  test "png": check matchFile(sampleFile("png")).mime.value == "image/png"
  test "gif": check matchFile(sampleFile("gif")).mime.value == "image/gif"
  test "webp": check matchFile(sampleFile("webp")).mime.value == "image/webp"
  test "tiff": check matchFile(sampleFile("tiff")).mime.value == "image/tiff"
  # archive
  test "gzip": check matchFile(sampleFile("gz")).mime.value == "application/gzip"
  test "zip": check matchFile(sampleFile("zip")).mime.value == "application/zip"
  # audio
  test "midi": check matchFile(sampleFile("mid")).mime.value == "audio/midi"
  test "wav": check matchFile(sampleFile("wav")).mime.value == "audio/x-wav"
