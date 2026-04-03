#!/bin/zsh

FILE="/mnt/nas/RpiBackups/sensor/backup-$(hostname)-$(date +%F-%H%M).img.gz"

sudo sync

# Backup and compress on the fly
sudo dd if=/dev/mmcblk0 bs=4M status=progress | gzip -1 > "$FILE"
# use this instead if you don't want to zip
# sudo dd if=/dev/mmcblk0 bs=4M status=progress of="$FILE" conv=fsync

# Verify gzip integrity
gzip -t "$FILE" && echo "Backup OK: $FILE"
