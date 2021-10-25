export PROJECT_ID='careful-mapper-323409'
export V_ZONE='asia-south2-a'
echo "Please provide the cluster name"
read cluster_name
#echo "Hi till here its fine"
echo $cluster_name
echo $PROJECT_ID
echo $V_ZONE
gcloud config set project $PROJECT_ID
gcloud config set compute/zone $V_ZONE
gcloud container clusters create $cluster_name --num-nodes=2
gcloud container clusters get-credentials $cluster_name
kubectl apply -f Deployment.yml
kubectl apply -f hpa.yml
kubectl expose deployment sre-bootcamp --type LoadBalancer --port 80 --target-port 80
