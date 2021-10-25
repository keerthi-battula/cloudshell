#create firewalls
gcloud compute firewall-rules create custome-firewall --allow tcp:8080

#1.Creating ComputeInstance called sre-terminal with CENTOS image
export VM_ZONE='us-central1-a'
gcloud compute instances create "$1" --image-project=centos-cloud --image-family=centos-8 --zone=$VM_ZONE --metadata startup-script='#!/bin/bash
 yum update 
 yum install -y yum-utils 
 yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo 
 yum install -y terraform 
 yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
 yum install -y docker-ce docker-ce-cli containerd.io
 systemctl start docker'

#copying the files into the new instance
 gcloud compute scp ./docker_image.sh "$1":~/ --zone=$VM_ZONE


 gcloud compute ssh --project prime-force-325303  --zone=$VM_ZONE "$1" -- 'sudo su'

 #Delete the instance 
 sh delete_GCE.sh "$1"
