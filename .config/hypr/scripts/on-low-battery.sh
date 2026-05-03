#!/usr/bin/env bash

BATTERY=$(/usr/bin/ls -1 /sys/class/power_supply | grep BAT | head -n1)
BATTERY="/sys/class/power_supply/$BATTERY"

notified="false"

while true; do

  charge_level=$(cat "$BATTERY/capacity")
  status=$(cat "$BATTERY/status")

  if [[ "$status" == "Discharging" ]]; then
    
    if (( charge_level <= 7 )); then
      notify-send "Power" "Battery Low ($charge_level%)! Hibernating..." -i battery-caution
      systemctl hibernate || notify-send "Power" "Hibernate failed" -i error
      
    elif (( charge_level <= 20 )) && [[ "$notified" == "false" ]]; then
      notify-send "Power" "Battery Low: $charge_level% remaining" -i battery-low
      notified="true"
      
    elif (( charge_level > 20 )); then
      notified="false"
    fi
  
  else
    # reset notified state when plugged in
    notified="false"
  fi

  sleep 60;
done
