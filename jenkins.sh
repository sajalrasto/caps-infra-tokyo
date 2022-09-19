#!/bin/bash

sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
#sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum upgrade
sudo yum install jenkins
sudo amazon-linux-extras install java-openjdk11
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl status jenkins
cat /var/lib/jenkins/secrets/initialAdminPassword
