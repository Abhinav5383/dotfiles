#!/usr/bin/env bash

IMG_PATH="/tmp/ocr_capture.png"
rm -f "$IMG_PATH"

grim -g "$(slurp)" "$IMG_PATH"

if [ ! -f "$IMG_PATH" ]; then
    exit 1
fi

# gthumb for mainly adjusting rotation of the images
if [ "$1" == "--adjust" ]; then
    gthumb "$IMG_PATH"
fi

magick "$IMG_PATH" -resize 200% - | \
tesseract stdin stdout | wl-copy

