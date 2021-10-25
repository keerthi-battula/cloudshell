gcloud config set compute/zone us-central1-a
gcloud container clusters create my-cluster --num-nodes=2
gcloud container clusters get-credentials my-cluster --zone us-central1-a
kubectl apply -f https://raw.githubusercontent.com/sravanin15/srebootcamp/main/gke_app_deploy/webapp_deployment.yaml
kubectl get nodes
kubectl apply -f https://raw.githubusercontent.com/sravanin15/srebootcamp/main/gke_app_deploy/webapp_hpa.yaml
kubectl expose deployment web-app --name=web-app-service --type=LoadBalancer --port 8080 --target-port 80
sleep 1m
kubectl get service