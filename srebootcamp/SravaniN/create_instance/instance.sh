export VM_NAME='sre-terminal'
export VM_ZONE='us-central1-a'
gcloud compute firewall-rules create myfirewallrule  --allow tcp:8080
gcloud compute instances create $VM_NAME --zone=$VM_ZONE --image-project=centos-cloud --image-family=centos-8 --metadata=startup-script='#! /bin/bash
yum update
yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io
systemctl start docker'