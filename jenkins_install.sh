#!/bin/bash
apt update
apt install openjdk-8-jdk -y
apt install ca-certificates
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update
apt-get install jenkins -y
key=$(cat /var/lib/jenkins/secrets/initialAdminPassword)