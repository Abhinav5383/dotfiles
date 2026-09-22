#!/usr/bin/env bash

DEVICE_JSON="$(pw-dump | jq -c '[.[] | select(.info.props."media.class"? == "Audio/Device")][0]')"

DEVICE_ID="$(jq -r '.id' <<< "$DEVICE_JSON")"
CARD_INDEX="$(jq -r '.info.props."api.alsa.card"' <<< "$DEVICE_JSON")"
ACTIVE_PROFILE_NAME="$(jq -r '.info.params.Profile[0].name' <<< "$DEVICE_JSON")"
ACTIVE_PROFILE_INDEX="$(jq -r '.info.params.Profile[0].index' <<< "$DEVICE_JSON")"

if [[ "$ACTIVE_PROFILE_NAME" == "off" ]]; then
    echo "Error: The current active profile is set to 'off'."
    echo "Please select a valid profile before running this script."
    exit 1
fi

MEDIA_STATE=$(playerctl status 2>/dev/null)
OFF_INDEX="$(jq -r '.info.params.EnumProfile[] | select(.name=="off") | .index' <<< "$DEVICE_JSON")"

wait_for_default_sink() {
    for i in $(seq 1 20); do
        wpctl get-volume @DEFAULT_AUDIO_SINK@ &>/dev/null && return 0
        sleep 0.05
    done
    return 1
}

# need to toggle profile once to reset the audio stack properly
wpctl set-profile "$DEVICE_ID" "$OFF_INDEX"
wait_for_default_sink

wpctl set-profile "$DEVICE_ID" "$ACTIVE_PROFILE_INDEX"
wait_for_default_sink

if [ "$MEDIA_STATE" = "Playing" ]; then
  sleep 0.5
  playerctl play
fi

# unmute the 'Headphone' to prevent muting/unmuting from killing the speakers' audio
amixer -c "$CARD_INDEX" sset 'Headphone' cap unmute 1>/dev/null
