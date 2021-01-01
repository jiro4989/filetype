import unittest, os

include filetype

const
  testDataDir = "tests"/"testdata"

func sampleFile(ext: string): string =
  return testDataDir/"sample." & ext

suite "proc matchFile":
  test "png": check matchFile(sampleFile("png")).mime.value == "image/png"
  test "jpeg": check matchFile(sampleFile("jpeg")).mime.value == "image/jpeg"
  test "jpg": check matchFile(sampleFile("jpg")).mime.value == "image/jpeg"
  test "gif": check matchFile(sampleFile("gif")).mime.value == "image/gif"
  test "gzip": check matchFile(sampleFile("gz")).mime.value == "application/gzip"
  test "zip": check matchFile(sampleFile("zip")).mime.value == "application/zip"
  test "midi": check matchFile(sampleFile("mid")).mime.value == "audio/midi"
  test "wav": check matchFile(sampleFile("wav")).mime.value == "audio/x-wav"
