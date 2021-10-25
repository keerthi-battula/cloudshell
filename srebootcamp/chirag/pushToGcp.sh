# Building the image
docker build -t gcr.io/custom-nginx-test/my-web-server:test .

# Pushing image to GCP
docker push gcr.io/custom-nginx-test/my-web-server:test