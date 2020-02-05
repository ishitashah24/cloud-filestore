#command to create cloud filestore instance

gcloud filestore instances create nfs-server \
    --project=[PROJECT_ID] \
    --zone=us-central1-c \
    --tier=STANDARD \
    --file-share=name="vol1",capacity=1TB \
    --network=name="default"
