#!/bin/bash

#docker
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo chmod 666 /var/run/docker.sock

sudo systemctl enable docker

# docker run -d -p 5000:5000 --restart unless-stopped --name flask-app akhilmovva/flask-image

#SSH
sudo apt install openssh-server -y
https://superuser.com/questions/1135766/how-to-ssh-from-one-ec2-instance-to-another

# #jre
# sudo apt install default-jre -y
# sudo apt install ssh

docker run -e MYSQL_ROOT_PASSWORD=akhil123 -d -p 3306:3306 --restart unless-stopped --name mysql8 mysql:8