#!/bin/bash

####################################################################
# Authors: Ahmad Aji Santoso
# Email: ahmad21@student.ub.ac.id
####################################################################

export LC_ALL=C
sudo apt-get update -y
### install python-minimal
sudo apt-get install python-minimal -y
#install Make
sudo apt-get install make -y
# install docker-engine
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce

echo "Docker installed..."

sudo usermod -aG docker ubuntu
sudo systemctl enable docker
sudo systemctl start docker
echo "########################################"
echo "########################################"

echo "##################### install docker-compose ########################"

sudo curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
echo "docker-compose installed..."
