#Building docker image for ui
cd ui
docker build -t us_todoapp-ui  .
docker tag us_todoapp-ui gcr.io/wise-cycling-321405/usimage
docker push gcr.io/wise-cycling-321405/usimage

#Building docker image for ui
cd ../template
docker build -t asia_todoapp-ui  .
docker tag asia_todoapp-ui gcr.io/wise-cycling-321405/asiaimage
docker push gcr.io/wise-cycling-321405/asiaimage

#Building docker image for api
cd ..
docker build -t todoapp-app .
docker tag todoapp-app gcr.io/wise-cycling-321405/todoapp-api
docker push gcr.io/wise-cycling-321405/todoapp-api
