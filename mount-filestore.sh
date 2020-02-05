#!/usr/bin/env bash

#install nfs on Ubuntu
sudo apt-get -y update
sudo apt-get install nfs-common

#make local directory to map to cloud filestore file share
sudo mkdir -p mount-point-directory

#set permissions to allow users to read/write
sudo chmod go+rw mount-point-directory

#confirm that the filestore file share is mounted
df -h --type=nfs

