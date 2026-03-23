# sensor-server

To backup this machine I've use this command to mount the osmc (NAS) server that I have at home
1. First crate the directory on the /mnt forlder
sudo mkdir -p /mnt/nas
2. Then use this command to do the mounting
sudo mount -t cifs //192.168.1.114/BackupDrive /mnt/nas -o username=osmc,password=<replace with the password>,uid=1000,gid=1000
or
run the mount script
3. Then use this command to back it up to a folder on the mounted drive
./backup.sh
4. unmount using the script


