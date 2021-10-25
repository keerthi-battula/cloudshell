# Getting the Project ID 

export PROJECT_ID=$(gcloud config get-value project)

echo Project ID -----> $PROJECT_ID

# Setting the Project as default
gcloud config set project $PROJECT_ID

# Cloning the Repository from Github in to Cloudshell VM
echo ******* Cloning the Repository from Github *******

git clone https://github.com/Palaniappan-Muthiah/Gcloud

cd Gcloud/Docker

# Building the custom image using Dockerfile

echo ******* Building the custom image *******

docker build -t asia.gcr.io/${PROJECT_ID}/my-app:v1 .

docker_build_result=$?
if [[ $docker_build_result != 0 ]]; then
   echo "Unable to build the image"
   exit 1
else
    echo ******* Printing the images list *******

    docker images

    echo ******* Pushing the image to GCR *******

    docker push asia.gcr.io/${PROJECT_ID}/my-app:v1
    
    docker_push_result=$?

     if [[ $docker_push_result != 0 ]]; then
        echo "Unable to push the image"
     fi

     echo ***** Image has been pushed to GCR *****

fi

#Creating the GKE Cluster

gcloud config set compute/zone asia-east1-a

echo ******* Creating the GKE Cluster with two nodes *******

gcloud container clusters create my-cluster --num-nodes=2

echo ******* Printing the nodes *******

kubectl get nodes

gcloud container clusters get-credentials my-cluster --zone asia-east1-a

echo *****88 Creating the deployment *******I

kubectl apply -f deployment.yaml

echo ******* HPA Setup Configuration *******

kubectl apply -f autoscale.yaml

echo ******* Getting the pods *******

kubectl get pods

echo ******* Exposing the deployment to external world *******

kubectl expose deployment my-app --name=my-app-service --type=LoadBalancer --port 80 --target-port 80

echo ******* Getting the External IP *******

kubectl get service --watch
