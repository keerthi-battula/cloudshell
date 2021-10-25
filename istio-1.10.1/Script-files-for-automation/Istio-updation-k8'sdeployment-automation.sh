export PROJECT_ID=aauthentic-codex-329608
export ZONE=us-central1-c

gcloud config set project $PROJECT_ID

gcloud beta container clusters update istio-demo-cluster --zone=$ZONE --update-addons=Istio=ENABLED --istio-config=auth=MTLS_PERMISSIVE


gcloud container clusters get-credentials istio-demo-cluster --zone=$ZONE --project=$PROJECT_ID

gcloud compute firewall-rules create todoappfirewall --project $PROJECT_ID --network default  --direction INGRESS --allow tcp:0-65535 

cd ../K8s-deployment-files


kubectl label namespace default istio-injection=enabled

kubectl apply -f api-deployment.yaml
kubectl apply -f api-service.yaml
kubectl apply -f ui-deployment.yaml
kubectl apply -f ui-service.yaml
kubectl apply -f autoscale-frontend.yaml
kubectl apply -f autoscale-backend.yaml

