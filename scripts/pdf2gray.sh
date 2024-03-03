#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 3 ]]; then
  echo "Usage: pdf2gray <input> <output>"
  exit 1
fi

gs -sOutputFile="$2" -sDEVICE=pdfwrite \
           -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray \
           -dCompatibilityLevel=1.4 "$1" < /dev/null
