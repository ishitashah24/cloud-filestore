#!/usr/bin/env bash

#install nfs on Ubuntu
function install_nfs()
{
  apt-get -y update
  apt-get install nfs-common
}

function set_mount_directory()
{
  export mount_point_directory = /mnt/test
  export IP_ADDRESS = 
  export FILESTORE_INSTANCE = 
  
  #make local directory to map to cloud filestore file share
  mkdir -p ${mount_point_directory}  
  
  #mount the filestore instance
  mount ${IP_ADDRESS}:/${FILESTORE_INSTANCE} ${mount_point_directory}
  
  #set permissions to allow users to read/write
  chmod go+rw ${mount_point_directory}
  
  #confirm that the filestore file share is mounted
  df -h --type=nfs
}

