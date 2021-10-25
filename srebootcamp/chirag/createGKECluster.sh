# GKE Cluster Creation 

export PROJECT_NAME='custom-nginx-test'
export CLUSTER_NAME='my-cluster'
export CLUSTER_ZONE='us-east1-b'
gcloud beta container --project $PROJECT_NAME clusters create $CLUSTER_NAME --zone $CLUSTER_ZONE --no-enable-basic-auth --cluster-version "1.20.8-gke.900" --release-channel "regular" --machine-type "e2-medium" --image-type "COS_CONTAINERD" --disk-type "pd-standard" --disk-size "100" --num-nodes "2"

# Getting the Credentials

gcloud container clusters get-credentials my-cluster --zone $CLUSTER_ZONE --project $PROJECT_NAME

