# Install Apache Beam (the load test)
sudo apt-get -y install apache2-utils

# Run the load test
ab -n 10000000 -c 1000 http://34.73.112.79:8080/