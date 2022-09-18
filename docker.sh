#!/bin/bash
sudo amazon-linux-extras install docker -y
sudo yum install docker -y
sudo service docker start
sudo service docker enable
sudo usermod -a -G docker ec2-user
#Make docker auto-start

sudo chkconfig docker on

# update and install docker
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
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

#creating docker container
docker run -dit --name docker-container -h linux.public.ip -p 8080:80 httpd httpd

#Download epel repository on the amazon linux 2 instance as follows,

wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
#Next, Install epel repository using yum.

sudo yum install epel-release-latest-7.noarch.rpm
#Update epel repository as follows,

sudo yum update -y
#Now install all individual packages inside the repository along with ansible.

sudo yum install python python-devel python-pip openssl ansible -y
# Install Ansible using amazon-linux-extras Repository
#Ansible package can be installed on amazon linux using amazon provided packages.

sudo amazon-linux-extras install ansible2
#Check Ansible version
#To verify whether Ansible is installed on your machine, you can verify it as follows,

ansible --version
