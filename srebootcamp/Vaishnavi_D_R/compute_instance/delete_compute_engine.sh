#get the project id
export PROJECT_ID=$(gcloud info --format='value(config.project)')

#compute instance name will be passed as commad line argument i.e 'sre-terminal'
export VM_NAME=$1

#zone will be passed as commad line argument i.e 'us-central1-a'
export VM_ZONE=$2

#set the project id
gcloud config set project $PROJECT_ID

#delete the compute instance
gcloud compute instances delete $VM_NAME --zone $VM_ZONE