# To Set the Default Project
gcloud config set project innate-client-321408

#----------------------------
#1.Run the nginx web server using docker
docker pull "$1"

res=$?
if [ $res != 0 ]; then
    echo "Image Pull error"
    exit 1
else 
    #2.Run the nginx webserver in the back ground as deamon
    docker run -it --rm -d -p 8081:80 --name web "$1"
    res=$?
    if [ $res == 0 ];then
        echo "The web server is running in the background as deamon"
        sleep 10
    
    fi

    #3. Create the index.html page and copy it in docker container path to replace the default html
    
    cd cust_index

    #4. Build new Image my-web-server with the container with base image and your html
     docker build -t my-web-server .
    res=$?
    if [ $res != 0 ]; then
        echo "Image build unsuccessful"
        exit 1
    else
        docker run -it --rm -d -p 8083:80 --name web1 my-web-server
        echo " navigate to http://localhost:8083 to make sure our html page is being served correctly."
        
        #5.Create the GCR image to be pushed to GCP
        echo " Creating the GCR image to be pushed to GCP"
        docker tag my-web-server gcr.io/innate-client-321408/my-web-server

        #6.Push the image my-web-server to the GCP
        docker push gcr.io/innate-client-321408/my-web-server
        echo "Image Pushed into the GCR"
    fi    
fi