#Building docker image for ui and tagging it as gcr image and pushing it to container registry
cd ui
docker build -t todoapp-ui-image .
docker tag todoapp-ui-image gcr.io/ancient-dragon-329412/todoapp-ui-image
docker push gcr.io/ancient-dragon-329412/todoapp-ui-image

#Building gcr image for api and tagging it as gcr image and pushing it to google container registry
cd ../api
docker build -t todoapp-api-image .
docker tag todoapp-api-image gcr.io/ancient-dragon-329412/todoapp-api-image
docker push gcr.io/ancient-dragon-329412/todoapp-api-image


