#!/bin/bash

#growing the /home volume size to 30GB
sudo growpart /dev/nvme0n1 4
lvextend -L 30G /dev/RootVG/rootVol
xfs_growfs /home 

sudo yum install -y yum-utilis
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform 
sudo dnf install -y ansible python3-boto3 python3-botocore
