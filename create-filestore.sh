#!/usr/bin/env bash

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
