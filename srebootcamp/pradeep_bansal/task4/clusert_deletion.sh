#! /bin/bash
echo "Please provide the cluster name which you want to delete"
read CLUSTER_NAME
echo "Do you want the stop the running cluster then press y/n"
read lv_input
#echo $lv_input
if [ $lv_input == y ]
then
gcloud container clusters delete $CLUSTER_NAME
else
echo "your input is not valid..Please provide the appropriote input.."
fi
