#create firewalls
gcloud compute firewall-rules create my-firewal1 --allow tcp:8080
#project id will be passed as an command line argument 'wise-cycling-321405'
export PROJECT_ID="$1"

#VM name will be passed as an command line argument 'sre-terminal'
export VM_NAME="$2" 

#VM zone will be passed as an command line argument 'us-central1-c'
export VM_ZONE="$3" 

#1.Creating ComputeInstance called sre-terminal with CENTOS image
gcloud compute instances create $VM_NAME --zone=$VM_ZONE --image-project=centos-cloud --image-family=centos-8  --metadata-from-file=startup-script=startup_script_for_VM.sh

#copying the files into the new instance
gcloud compute scp ~/vm_configuration_file.sh $VM_NAME:~/ --zone=$VM_ZONE


gcloud compute ssh --project $PROJECT_ID --zone $VM_ZONE $VM_NAME -- 'sudo su && bash vm_configuration_file.sh'

