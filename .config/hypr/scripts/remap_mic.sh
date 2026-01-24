#!/usr/bin/env bash
set -euo pipefail

REAL_MIC_SOURCE="alsa_input.pci-0000_00_1f.3-platform-sof-essx8336.stereo-fallback"

VIRT_SINK="virt_mic_sink"
VIRT_MIC="virtual_mic"

pactl load-module module-null-sink \
  sink_name="$VIRT_SINK" \
  sink_properties="device.description=$VIRT_SINK"

pactl load-module module-loopback \
  source="$REAL_MIC_SOURCE" \
  sink="$VIRT_SINK"

pactl load-module module-remap-source \
  master="${VIRT_SINK}.monitor" \
  source_name="$VIRT_MIC" \
  source_properties="device.description=Virtual Mic"

pactl set-default-source $VIRT_MIC

echo
echo "Created virtual capture device: $VIRT_MIC"
