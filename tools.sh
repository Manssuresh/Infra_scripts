#!/bin/bash
#for amazonlinux2023
#https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-manual-agent-install.html

sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl status amazon-ssm-agent
#Replace region with the region name eg: ap-south-1 for Mumbai
sudo yum install -y https://s3.region.amazonaws.com/amazon-ssm-region/latest/linux_amd64/amazon-ssm-agent.rpm
#create iam role with ssm full access permission and attach this role to ec2

#Install telnet and nc tools
sudo yum -y install telnet
sudo yum install -y nc
