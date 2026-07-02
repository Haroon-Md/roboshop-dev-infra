#!/bin/bash

#growing the /home volume size to 30GB
sudo growpart /dev/nvme0n1 4
lvextend -L +30G /dev/RootVG/homeVol
xfs_growfs /home 

sudo yum install -y yum-utilis
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform 
sudo dnf install -y ansible python3-boto3 python3-botocore

#creating databases
cd /home/ec2-user
git clone https://github.com/Haroon-Md/roboshop-dev-infra.git
chown ec2-user:ec2-user -R roboshop-dev-infra
cd roboshop-dev-infra/40-databases
terraform init
terraform apply -auto-approve