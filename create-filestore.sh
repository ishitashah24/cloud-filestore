#!/usr/bin/env bash

export PROJECT_ID = 
export ZONE = us-west1-a
export FILESHARE_NAME = "test_filestore"
export CAPACITY = 1TB

#create cloud filestore instance
gcloud filestore instances create nfs-server \
    --project=${PROJECT_ID} \
    --zone=${ZONE} \
    --tier=STANDARD \
    --file-share=name=${FILESHARE_NAME},capacity=${CAPACITY} \
    --network=name="default"

#get ip address of the instance
gcloud filestore instances describe ${FILESHARE_NAME} \
    --project=${PROJECT_ID} \
    --zone=${ZONE}
