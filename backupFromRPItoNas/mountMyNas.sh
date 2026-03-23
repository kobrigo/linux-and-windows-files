#!/bin/zsh

#create the folder on which the mounting will be done
echo "create folder /mnt/nas"
sudo mkdir -p /mnt/nas

#do the mounting
echo "mounting remote folder 192.168.1.114/BackupDrive use the password for osmc like the ssh login"
sudo mount -t cifs //192.168.1.114/BackupDrive /mnt/nas -o username=osmc,uid=1000,gid=1000

