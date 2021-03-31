====
filetype
====

|nimble-version| |nimble-install| |gh-actions|

Small and dependency free Nim package to infer file and MIME type checking the magic numbers signature.
filetype is heavily inspired by `h2non/filetype <https://github.com/h2non/filetype>`_.

.. contents:: Table of contents

Usage
=====

.. code-block:: nim

   import filetype

   doAssert matchFile("tests/testdata/sample.png").mime.value == "image/png"
   doAssert isPngFile("tests/testdata/sample.png")
   if isZipFile("tests/testdata/sample.zip"):
     echo "file is zip"

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

.. |gh-actions| image:: https://github.com/jiro4989/filetype/workflows/test/badge.svg
   :target: https://github.com/jiro4989/filetype/actions
.. |nimble-version| image:: https://nimble.directory/ci/badges/filetype/version.svg
   :target: https://nimble.directory/ci/badges/filetype/nimdevel/output.html
.. |nimble-install| image:: https://nimble.directory/ci/badges/filetype/nimdevel/status.svg
   :target: https://nimble.directory/ci/badges/filetype/nimdevel/output.html
