
docker build -t my-web-servers .
docker tag my-web-servers gcr.io/delta-repeater-322705/my-web-servers
docker push gcr.io/delta-repeater-322705/my-web-servers
docker run -it --rm -d -p 8080:80 --name my-web-container gcr.io/delta-repeater-322705/my-web-servers
