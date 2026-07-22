#!/bin/bash
echo "File: $1"
/opt/homebrew/bin/exiftool "-all*=" -r -overwrite_original $1
