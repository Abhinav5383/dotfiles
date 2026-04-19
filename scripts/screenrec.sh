#!/usr/bin/env bash

killall -SIGINT -q gpu-screen-recorder && exit 0

video="$HOME/Videos/captures/$(date +'%Y-%m-%d_%H-%M-%S.mp4')"

gpu-screen-recorder -w portal -a default_output -o "$video"
notify-send -t 5000 -u low "GPU Screen Recorder" "Video saved to $video"
