#get the project id
export PROJECT_ID=$(gcloud info --format='value(config.project)')

#cluster name will be passed as an command line argument 'my-cluster'
export cluster_name=$1

#zone will be passed as an command line argument 'us-central1-c'
export ZONE=$2

#set the project id
gcloud config set project $PROJECT_ID

#Set the default region
#gcloud config set compute/region us-west1

#Set the default zone
gcloud config set compute/zone $ZONE

#1.Create a GKE cluster with 2 nodes
gcloud container clusters create $cluster_name --num-nodes="2" 

kubectl get nodes

#updates a kubeconfig file with appropriate credentials and endpoint information to point kubectl
gcloud container clusters get-credentials $cluster_name --zone $ZONE

#creating deployment and hpa and exposing using commands
#(Creating the deployment using the my-web-server image from GCR
#kubectl create deployment my-web-server --image=gcr.io/innate-client-321408/my-web-server 

#Customizing the resource by adding the limits
#kubectl set resources deployment my-web-server -c=my-web-server --limits=cpu=200m

#Seeting up HPA to scale-up till 5 replicas if CPU % goes beyond 50
#kubectl autoscale deployment my-web-server --cpu-percent=50 --min=2 --max=5

#Exposing the server to make the server accessible on the internet
#kubectl expose deployment my-web-server --type LoadBalancer --port 8080 --target-port 80)

#Creating the deployment using the my-web-server image from GCR
kubectl apply -f deployment.yaml
#Setting up HPA to scale-up till 5 replicas if CPU % goes beyond 50
kubectl apply -f hpa.yaml

kubectl get pods

#Exposing the server to make the server accessible on the internet
kubectl expose deployment helloweb --name=hello-app-service --type=LoadBalancer --port 8080 --target-port 80

kubectl get service
