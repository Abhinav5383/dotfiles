#!/usr/bin/env bash

# to be ran as root

files=(/boot/vmlinuz* /boot/EFI/systemd/systemd-bootx64.efi /boot/EFI/BOOT/BOOTX64.EFI)

for file in "${files[@]}"; do
  sbctl sign -s "$file";
done
