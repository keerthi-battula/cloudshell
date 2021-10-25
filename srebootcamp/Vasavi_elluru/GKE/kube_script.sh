#Set the default region
gcloud config set compute/region us-west1

#Set the default zone
gcloud config set compute/zone us-west1-a

#1.Create a GKE cluster with 2 nodes
gcloud container clusters create "$1" --num-nodes=2

gcloud container clusters get-credentials "$1"

#Creating the deployment using the my-web-server image from GCR
kubectl create deployment my-web-server --image=gcr.io/innate-client-321408/my-web-server 

#Customizing the resource by adding the limits
kubectl set resources deployment my-web-server -c=my-web-server --limits=cpu=200m

#2.Seeting up HPA to scale-up till 5 replicas if CPU % goes beyond 50
kubectl autoscale deployment my-web-server --cpu-percent=50 --min=2 --max=5

#3.Exposing the server to make the server accessible on the internet
kubectl expose deployment my-web-server --type LoadBalancer --port 8080 --target-port 80

#4.Shell script to delete the cluster
sh delete_cluster.sh "$1"
