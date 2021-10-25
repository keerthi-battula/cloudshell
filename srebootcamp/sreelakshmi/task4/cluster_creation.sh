gcloud config set compute/zone us-central1-a
gcloud container clusters create my-cluster --num-nodes=2
kubectl get nodes
gcloud container clusters get-credentials my-cluster --zone us-central1-a
kubectl apply -f deployment.yaml
kubectl apply -f hpa.yaml
kubectl expose deployment hello-app --name=hello-app-service --type=LoadBalancer --port 8080 --target-port 80
sleep 2m
kubectl get pods
kubectl get svc
