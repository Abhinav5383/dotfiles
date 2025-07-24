#!/bin/bash

SAVE_DIR="$HOME/Pictures/Screenshots"

mkdir -p "$SAVE_DIR"
temp_file=$(mktemp -t screenshot_XXXXXX.png)

timestamp=$(date +'%Y%m%d_%H%M%S')
output_filename="${SAVE_DIR}/screenshot_${timestamp}.png"

trap 'rm -f "$temp_file"' EXIT


if grim "$temp_file"; then
    if ! satty -f "$temp_file" -o "$output_filename" --copy-command "wl-copy" ; then
        notify-send "Screenshot" "Screenshot captured but Satty failed to process it."
    fi
else
    notify-send "Screenshot" "Failed to capture screenshot"
fi
