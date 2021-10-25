sudo su 
terraform -v 
docker -v 
gcloud auth configure-docker
docker pull gcr.io/careful-mapper-323409/my-web-server-version2
docker run -d -it -p 8080:80 --name my-web-container gcr.io/careful-mapper-323409/my-web-server-version2

