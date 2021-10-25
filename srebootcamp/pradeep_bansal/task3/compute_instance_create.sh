gcloud compute firewall-rules create my-firewal1 --allow tcp:8080

export PROJECT_ID='careful-mapper-323409'

#export VM_NAME='sre-terminal'
export VM_NAME='sre-bootcamp'

export VM_ZONE='asia-south2-a'

gcloud compute instances create $VM_NAME --zone=$VM_ZONE --image-project=centos-cloud --image-family=centos-8  --metadata-from-file=startup-script=startup_script_for_VM.sh

gcloud compute scp ~/vm_configuration_file.sh $VM_NAME:~/ --zone=$VM_ZONE

gcloud compute ssh --project $PROJECT_ID --zone $VM_ZONE $VM_NAME -- 'sudo su && bash vm_configuration_file.sh'

