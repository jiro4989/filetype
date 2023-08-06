====
filetype
====

|gh-actions|

Small and dependency free Nim package to infer file and MIME type checking the magic numbers signature.
filetype is heavily inspired by `h2non/filetype <https://github.com/h2non/filetype>`_.

.. contents:: Table of contents

Usage
=====

.. code-block:: nim

   import filetype
   let content = readFile("tests/testdata/sample.png")
   doAssert match(content).extension == "png"
   doAssert matchFile("tests/testdata/sample.png").mime.value == "image/png"
   doAssert isPngFile("tests/testdata/sample.png")
   if isZipFile("tests/testdata/sample.zip"):
     echo "file is zip"

Types
=============

.. code-block:: nim

   type
      FileType* = object
         mime*: Mime
         extension*: string ## File extension. (ex: `zip`)
      Mime* = object
         ## MIME type.
         typ*: string     ## Ex: `application` of `application/gzip`.
         subType*: string ## Ex: `gzip` of `application/gzip`.
         value*: string   ## Ex: `application/gzip` of `application/gzip`.

API documents
=============

See `filetype module <https://jiro4989.github.io/filetype/filetype.html>`_.

Installation
============

.. code-block:: shell

   $ nimble install -Y filetype

Supported format
================

=======   ======
Type      Format
=======   ======
Image     jpeg, jp2, png, gif, webp, cr2, tiff, bmp, jxr, psd, ico, dwg
Archive   gz, zip, bz2, 7z, pdf, exe, rtf, nes, crx, ps, xz, sqlite, deb, ar, lz, rpm, elf
Audio     midi, ogg, flac, wav, amr, mp3, aac
Font      woff, woff2, ttf, otf
Video     wmv, flv, avi, mpeg, mp4
=======   ======

LICENSE
=======

MIT

Reference
=========

* https://en.wikipedia.org/wiki/List_of_file_signatures
* https://en.wikipedia.org/wiki/JPEG
* https://en.wikipedia.org/wiki/Portable_Network_Graphics
* https://en.wikipedia.org/wiki/GIF
* https://en.wikipedia.org/wiki/BMP_file_format
* https://en.wikipedia.org/wiki/JPEG_XR

.. |gh-actions| image:: https://github.com/jiro4989/filetype/workflows/test/badge.svg
   :target: https://github.com/jiro4989/filetype/actions
