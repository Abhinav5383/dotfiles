#!/usr/bin/env bash

yt-dlp \
        -f bestaudio \
        --extract-audio \
        --audio-quality 0 \
        --audio-format opus \
        --embed-thumbnail \
        --embed-metadata \
        --newline \
        --ignore-config \
        --no-playlist \
        -o "%(title).200s.%(ext)s" \
        --no-overwrites \
        --download-archive ~/.config/yt-dlp/archive.txt \
        "$@"
