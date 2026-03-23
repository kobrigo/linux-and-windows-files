#!/bin/zsh

FILE="/mnt/nas/RpiBackups/sensor/backup-$(date +%F-%H%M).img"
sudo sync
sudo dd if=/dev/mmcblk0 bs=4M status=progress of="$FILE" conv=fsync
# If you want to gzip the files while you back it up. Uncommang the next 2 lines instead of the line before this (didn't try it yet should work)
#sudo dd if=/dev/mmcblk0 bs=4M status=progress | gzip -1 > "$FILE"
#gzip -t "$FILE" && echo "Backup OK: $FILE"
