#Delete Compute Instance

export VM_NAME='sre-terminal'
gcloud instances delete $VM_NAME --zone=us-central1-a
