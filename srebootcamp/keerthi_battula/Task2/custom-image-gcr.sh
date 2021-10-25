# To Set the Default Project
export PROJECT_ID=$(gcloud info --format='value(config.project)')

gcloud config set project $PROJECT_ID

#Run the nginx web server using docker
docker pull "$1"

res=$?
if [ $res != 0 ]; then
    echo "Image Pull error"
    exit 1
else 

echo "............ Running nginx web server using docker............"
docker run -it --rm  -p 8080:80 --name web "$1"

#Run the nginx webserver in the back ground as deamon
    docker run -it --rm -d -p 8081:80 --name web "$1"
    if [ "$( docker container inspect -f '{{.State.Status}}' web )" == "running" ];then
        echo "The web server is running in the background as deamon"
        sleep 10
    fi

fi

echo ".............Stopping nginx container........."
docker stop web

#Create your index.html
#newly created index.html is located in same directory
#https://www.docker.com/blog/how-to-use-the-official-nginx-docker-image/
#And copy it in the docker container path to replace the default index.html (To do this we have used a docker file. other way is to change the root location in host file)
#https://www.rapidvaluesolutions.com/tech_blog/nginx-server-deploying-web-applications/
#To build a custom image, we’ll need to create a Dockerfile and add our commands to it. In the same directory, create a file named Dockerfile and paste the below commands.

#Build a new image my-web-server with the container with the base image, and your html
echo "...................Building custom docker image..........."
cd custom_index

docker build -t my-web-server .

cd ..

echo ".................Running new docker image with custom index.html................"
docker run -it --rm -d -p 8080:80 --name my-web-server-container my-web-server
if [ "$( docker container inspect -f '{{.State.Status}}' my-web-server-container )" == "running" ]; then
	echo "container my-web-server-container is running!"
fi

#Create the GCR Image to be pushed to GCP
echo "............... Tagging new Docker image to push into container registry................"
docker tag my-web-server gcr.io/wise-cycling-321405/my-web-server
rc=$?
if [[ $rc != 0 ]]; then 
	echo "not tagged!"
	exit 1
else
#Push the Image my-web-server to GCP
echo "...................Pushing into Gcr..............."
docker push gcr.io/wise-cycling-321405/my-web-server; rc=$?;
if [[ $rc != 0 ]]; then 
		echo -e "ERROR: Push failed, are you logged in to $REGISTRY? (e.g. \$ docker login $REGISTRY)" 
		exit 1
fi
exit 1
fi     
