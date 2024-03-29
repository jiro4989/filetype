# Package

version       = "0.9.0"
author        = "jiro4989"
description   = "Small and dependency free Nim package to infer file and MIME type checking the magic numbers signature."
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 1.4.0"

task docs, "generate documents":
  let docDir = ".docs"
  selfExec "doc --index:on --project --out:" & docDir & " src/filetype.nim"
  rmDir docDir
