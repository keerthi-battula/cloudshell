gcloud auth congigure-docker
docker pull gcr.io/myproject1-321806/my-web-server
docker run -it --rm -d -p 8080:80 --name webserver gcr.io/myproject1-321806/my-web-server 