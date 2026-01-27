#!/usr/bin/env bash

state=$(playerctl status 2>/dev/null)

~/.config/hypr/scripts/reset-profile.sh

if [ "$state" = "Playing" ]; then
  sleep 0.5
  playerctl play
fi
