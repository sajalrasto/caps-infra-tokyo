#!/bin/bash
sudo amazon-linux-extras install docker -y
sudo yum install docker -y
sudo service docker start
sudo service docker enable
sudo usermod -a -G docker ec2-user
#Make docker auto-start

sudo chkconfig docker on

# update and install docker
sudo yum install docker-ce docker-ce-cli containerd.io -y
sudo chmod 666 /var/run/docker.sock

#Because you always need it....

sudo yum install -y git

#Reboot to verify it all loads fine on its own.

#sudo reboot

docker-compose install
#Copy the appropriate docker-compose binary from GitHub:

sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

#NOTE: to get the latest version (thanks @spodnet): 
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

#Fix permissions after download:

sudo chmod +x /usr/local/bin/docker-compose

#Verify success:

docker-compose version
