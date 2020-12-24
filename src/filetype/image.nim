import types

const
  typeJpeg* = newFileType("image/jpeg", "jpg")
  typeJpeg2000* = newFileType("image/jp2", "jp2")
  typePng* = newFileType("image/png", "png")
  typeGif* = newFileType("image/gif", "gif")
  typeWebp* = newFileType("image/webp", "webp")
  typeCr2* = newFileType("image/x-canon-cr2", "cr2")
  typeTiff* = newFileType("image/tiff", "tif")
  typeBmp* = newFileType("image/bmp", "bmp")
  typeJxr* = newFileType("image/vnd.ms-photo", "jxr")
  typePsd* = newFileType("image/vnd.adobe.photoshop", "psd")
  typeIco* = newFileType("image/vnd.microsoft.icon", "ico")
  typeHeif* = newFileType("image/heif", "heif")
  typeDwg* = newFileType("image/vnd.dwg", "dwg")
