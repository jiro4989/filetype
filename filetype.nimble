# Package

version       = "0.4.0"
author        = "jiro4989"
description   = "Small and dependency free Nim package to infer file and MIME type checking the magic numbers signature."
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 1.4.0"

task docs, "generate documents":
  selfExec "doc --index:on --project --out:documents src/filetype.nim"
