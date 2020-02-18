#!/bin/bash

sudo yum -y upgrade
sudo yum -y update
#sudo yum -y install httpd
sudo yum -y install ec2-instance-connect

sudo yum install -y ruby
sudo yum install -y wget
cd /home/ec2-user
wget https://aws-codedeploy-ap-northeast-2.s3.ap-northeast-2.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto

sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent


#sudo echo "Hello Iam Ray. This is test" >> /var/www/html/index.html
#sudo service httpd start
