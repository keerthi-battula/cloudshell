#get the project id
export PROJECT_ID=$(gcloud info --format='value(config.project)')

#the argument will be passed as commad line argument i.e 'sre-terminal'
export VM_NAME=$1

#the argument will be passed as commad line argument i.e 'us-central1-a'
export VM_ZONE=$2

#copy files to and from Google Compute Engine virtual machines via scp
gcloud compute scp ~/create_service_on_gce.sh $VM_NAME:~/ --zone=$VM_ZONE

#SSH into a virtual machine instance
gcloud compute ssh --project $PROJECT_ID --zone=$VM_ZONE $VM_NAME -- 'sudo su'

