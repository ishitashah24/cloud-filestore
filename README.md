# Mount Cloud Filestore on Dataproc Cluster
This script describes an init action that mounts filestore instance when dataproc clusters spin up. 

# Create Filestore
This script sets environment variables, creates a filestore instance, and verifies its creation. 

# Mount Filestore
This script mounts the filestore instance on dataproc cluster.
Make a local directory and mount the file share from the Cloud Filestore instance.
```FILESHARE_NAME`` is the name of file share
```FILESTORE_INSTANCE_NAME``` is the name of filestore instance

# Run the file

Create a bucket and copy the intitalization actions into the bucket to ensure consistent use of the same initalization action code across all Dataproc clusters. 

Example: Spin up Dataproc cluster with init-action script and mount filestore instance

```
BUCKET_NAME=<init_actions_bucket>
CLUSTER=<cluster_name>
REPO_NAME=<repository_name>
gsutil cp dataproc-init-actions/create-filestore.sh gs://${BUCKET_NAME}/
gsutil cp dataproc-init-actions/mount-filestore.sh gs://${BUCKET_NAME}/
gcloud dataproc clusters create ${CLUSTER} --initialization-actions gs://${BUCKET_NAME}/{$REPO_NAME}/mount-filestore.sh

```



