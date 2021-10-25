#get the project id
export PROJECT_ID=$(gcloud info --format='value(config.project)')

#compute instance name will be passed as command line argument i.e 'sre-terminal'
export VM_NAME=$1

#zone will be passed as command line argument i.e 'us-central1-a'
export VM_ZONE=$2

#firewall name will be passed as command line argument i.e 'sre-terminal-firewall'
export FIREWALL_NAME=$3

#set the project id
gcloud config set project $PROJECT_ID

#create a firewall
gcloud compute firewall-rules create $FIREWALL_NAME --allow tcp:8080

#create a compute instance with startup script
gcloud compute instances create $VM_NAME --zone=$VM_ZONE --image-project=centos-cloud --image-family=centos-8 --metadata-from-file=startup-script=startup_script.sh