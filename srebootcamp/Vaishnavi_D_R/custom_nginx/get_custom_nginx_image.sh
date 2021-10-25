#Run the nginx web server using docker
echo "............ Running nginx web server using docker............"
docker run -it --rm -p 8080:80 --name web nginx
#Run the nginx web server in background as a daemon
echo ".............Running nginx web server in background as a deamon.........."
docker run -it -d --rm -p 8080:80 --name web nginx
if [ "$( docker container inspect -f '{​​​{​​​.State.Status}​​​}​​​' web )" == "running" ]; then
echo "container web is running!"
fi
echo ".............Stopping nginx container........."
docker stop web
#Build a new image my-web-server with the container with the base image, and your html
echo "...................Building custom docker image..........."
cd custom
docker build -t my-web-server .
cd ..
echo ".................Running new docker image with custom index.html................"
docker run -it --rm -d -p 8080:80 --name my-web-server-container my-web-server
if [ "$( docker container inspect -f '{​​​{​​​.State.Status}​​​}​​​' my-web-server-container )" == "running" ]; then
echo "container my-web-server-container is running!"
fi
#Create the GCR Image to be pushed to GCP
echo "............... Tagging new Docker image to push into container registry................"
docker tag my-web-server gcr.io/curious-memory-322511/my-web-server
rc=$?
if [[ $rc != 0 ]]; then
echo "not tagged!"
exit 1
else
#Push the Image my-web-server to GCR
echo "...................Pushing into Gcr..............."
docker push gcr.io/curious-memory-322511/my-web-server; rc=$?;
if [[ $rc != 0 ]]; then
echo -e "\nERROR: Push failed, are you logged in to $REGISTRY? (e.g. \$ docker login $REGISTRY)"
exit 1
fi
exit 1
fi
