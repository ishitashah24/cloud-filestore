#!/usr/bin/env bash

#    Copyright 2020 Google, Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

#This script mounts cloud filestore on Dataproc cluster. 


#get information about filestore instance
export FILESTORE_INSTANCE_NAME = $1
export IP_ADDRESS = $(gcloud filestore instances describe ${FILESTORE_INSTANCE_NAME} \
                       --project=${PROJECT_ID} \
                       --zone=${ZONE}  
                       --format="value(networks.ipAddress)")

#install nfs on Ubuntu
function install_nfs()
{
  apt-get -y update
  apt-get install nfs-common
}


function set_mount_directory()
{
  export mount_point_directory = /mnt/test
  
  #make local directory to map to cloud filestore file share
  mkdir -p ${mount_point_directory}  
  
  #mount the filestore instance
  mount ${IP_ADDRESS}:/${FILESTORE_INSTANCE_NAME} ${mount_point_directory}
  
  #set permissions to allow users to read/write
  chmod go+rw ${mount_point_directory}
  
  #confirm that the filestore file share is mounted
  df -h --type=nfs
  
}

function main()
{
  install_nfs
  get_parameters nfs-server
  set_mount_directory
  
}

main




