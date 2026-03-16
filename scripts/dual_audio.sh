#!/bin/bash

SINKS=$(pactl list sinks short | awk '{print $2}')

INTERNAL_SPKR=$(printf "$SINKS" | grep alsa)
BT_SPKR=$(printf "$SINKS" | grep blue)

DELAY_MS=340
DELAYED_SINK="delayed_sink"
COMBINED_SINK="dual_out"

# null sink for simulating delay
pactl load-module module-null-sink \
    sink_name=$DELAYED_SINK \
    sink_properties=device.description=$DELAYED_SINK

# loopback the null sink to internal speakers with added delay
pactl load-module module-loopback \
    sink=$INTERNAL_SPKR \
    source=${DELAYED_SINK}.monitor \
    latency_msec=$DELAY_MS

# create a sink that splits the audio between both bt speakers and the internal speaker's null sink
pactl load-module module-combine-sink \
    sink_name=$COMBINED_SINK \
    slaves="$BT_SPKR,$DELAYED_SINK" \
    sink_properties=device.description=$COMBINED_SINK

echo ""
echo "Done."
echo "Use '$COMBINED_SINK' as output device."

