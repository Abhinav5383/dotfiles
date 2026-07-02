#!/usr/bin/env bash

CARD_INFO=$(pactl list cards | awk '
/^Card #/ { if (++c > 1) exit }
{ print }
')

CARD_NAME="$(printf '%s\n' "$CARD_INFO" | awk -F': ' '/^\s*Name:/ { print $2 }')"

ACTIVE_PROFILE="$(printf '%s\n' "$CARD_INFO" \
    | awk -F': ' '/^\s*Active Profile:/ { print $2 }')"

if [[ "$ACTIVE_PROFILE" == "off" ]]; then
    echo "Warning: The current active profile is set to 'off'."
    echo "Please select a valid profile through 'pavucontrol > Configuration' before running this script."
    exit 1
fi

MEDIA_STATE=$(playerctl status 2>/dev/null)

# need to toggle card-profile once to reset the audio stack properly
pactl set-card-profile "$CARD_NAME" off
pactl set-card-profile "$CARD_NAME" "$ACTIVE_PROFILE"

if [ "$MEDIA_STATE" = "Playing" ]; then
  sleep 0.5
  playerctl play
fi


# unmute the 'Headphone' to prevent muting/unmuting from killing the speakers' audio
CARD_INDEX="$(printf '%s\n' "$CARD_INFO" \
    | awk -F'"' '/api\.alsa\.card =/ { print $2 }')"

amixer -c "$CARD_INDEX" sset 'Headphone' cap unmute 1>/dev/null

