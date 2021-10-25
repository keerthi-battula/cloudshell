#get the project id
export PROJECT_ID=$(gcloud info --format='value(config.project)')

#cluster name will be passed as an command line argument 'my-cluster'
export CLUSTER_NAME=$1

#zone will be passed as an command line argument 'us-central1-a'
export ZONE=$2

#set the project id
gcloud config set project $PROJECT_ID

#set the zone
gcloud config set compute/zone $ZONE

#create a cluster with two nodes
gcloud container clusters create $CLUSTER_NAME --num-nodes "2" 

#get nodes created
kubectl get nodes

#get credentials of the cluster
#updates a kubeconfig file with appropriate credentials and endpoint information to point kubectl 
gcloud container clusters get-credentials $CLUSTER_NAME --zone $ZONE

#creating deployment
kubectl apply -f deployment1.yaml

#creating horizontal pod autoscaling
kubectl apply -f hpa.yaml

#get the pods created
kubectl get pods

#create the service and expose it to the internet
#kubectl expose deployment helloweb --name=hello-app-service --type=LoadBalancer --port 8080 --target-port 80
kubectl apply -f service.yaml

#get the service
kubectl get service
