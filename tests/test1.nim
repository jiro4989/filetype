import unittest, os

include filetype

const
  testDataDir = "tests"/"testdata"

suite "proc matchFile":
  test "png": check matchFile(testDataDir/"sample.png").mime.value == "image/png"
  test "jpeg": check matchFile(testDataDir/"sample.jpeg").mime.value == "image/jpeg"
  test "jpg": check matchFile(testDataDir/"sample.jpg").mime.value == "image/jpeg"
  test "gif": check matchFile(testDataDir/"sample.gif").mime.value == "image/gif"
