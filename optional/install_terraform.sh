#!/bin/bash

echo Downloading terraform
mkdir terraform
cd terraform/
wget https://releases.hashicorp.com/terraform/0.10.1/terraform_0.10.1_linux_amd64.zip
unzip terraform_0.10.1_linux_amd64.zip

echo Docker cp to docker container
docker exec -it --user root atlassian-bamboo mkdir -p /var/terraform
docker cp terraform atlassian-bamboo:/var/terraform/.

echo Removing temp
cd ..
rm -fr terraform
