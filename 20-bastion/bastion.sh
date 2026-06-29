#!/bin/bash

sudo yum install -y yum-utilis
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform 
sudo dnf install -y ansible python3-boto3 python3-botocore