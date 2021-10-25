# Install Apache Beam (the load test)
sudo apt-get -y install apache2-utils

# Run the load test
ab -n 80000 -c 1000 http://34.70.182.158:8081/