#!/usr/bin/env bash

rmpc "$@"

status=$(playerctl -p mpd status 2>/dev/null)

if [[ "$status" != "Playing" && "$status" != "Paused" ]]; then
    systemctl --user stop mpd-mpris.service mpd.service
fi
