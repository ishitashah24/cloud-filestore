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

#This script creates cloud filestore instance.


set -euxo pipefail

export PROJECT_ID = "pso-wmt-data"
export ZONE = "us-west1-a"
export FILESTORE_NAME = "test_filestore"
export CAPACITY = 1TB
export NETWORK_NAME = "default"

#create cloud filestore instance
gcloud filestore instances create nfs-server \
    --project=${PROJECT_ID} \
    --zone=${ZONE} \
    --tier=STANDARD \
    --file-share-name=${FILESTORE_NAME},capacity=${CAPACITY} \
    --network-name=${NETWORK_NAME}

#verify that filestore has been created
gcloud filestore instances describe ${FILESTORE_NAME} \
    --project=${PROJECT_ID} \
    --zone=${ZONE}
