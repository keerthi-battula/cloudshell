#check terraform version
terraform -v

#check docker version
docker -v

#register gcloud as a Docker credential helper
gcloud auth configure-docker --quiet

#pull my-web-server image from gcr
docker pull gcr.io/curious-memory-322511/my-web-server

#run the container 
docker run -d -it -p 8080:80 --name my-web-container gcr.io/curious-memory-322511/my-web-server