# Deleting the Cluster

export CLUSTER_NAME='my-cluster'
export CLUSTER_ZONE='us-east1-b'
gcloud container clusters delete $CLUSTER_NAME --zone $CLUSTER_ZONE