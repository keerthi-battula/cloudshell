#get the project id
export PROJECT_ID=$(gcloud info --format='value(config.project)')

#cluster name will be passed as an command line argument 'my-cluster'
export CLUSTER_NAME=$1

#zone will be passed as an command line argument 'us-central1-a'
export ZONE=$2

#set the project id
gcloud config set project $PROJECT_ID

#delete the container
gcloud container clusters delete $CLUSTER_NAME --zone $ZONE 
