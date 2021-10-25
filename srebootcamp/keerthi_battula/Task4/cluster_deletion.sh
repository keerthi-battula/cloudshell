export CLUSTER_NAME=$1
export ZONE=$2
gcloud conatiner clusters delete $CLUSTER_NAME --zone $ZONE