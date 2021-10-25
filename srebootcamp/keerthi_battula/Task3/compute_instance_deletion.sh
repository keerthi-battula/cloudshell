export VM_NAME="$1" #'sre-terminal'

export VM_ZONE="$2" #'us-central1-c'

gcloud compute instances delete $VM_NAME --zone=$VM_ZONE
