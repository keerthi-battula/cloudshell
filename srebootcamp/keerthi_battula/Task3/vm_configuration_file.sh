sudo su 
terraform -v 
docker -v 
gcloud auth configure-docker
docker pull gcr.io/wise-cycling-321405/my-web-server
docker run -d -it -p 8080:80 --name my-web-container gcr.io/wise-cycling-321405/my-web-server