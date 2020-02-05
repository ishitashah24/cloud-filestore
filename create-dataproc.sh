BUCKET=<your_init_actions_bucket>
CLUSTER=<cluster_name>
gsutil cp cloud-firestore/mount-filestore.sh gs://${BUCKET}/
gcloud dataproc clusters create ${CLUSTER} --initialization-actions gs://${BUCKET}/mount-filestore.sh
