#!/bin/sh

echo Stopping existing container
docker stop atlassian-bamboo
docker stop atlassian-bamboo-postgres

echo Copying and running service
yes | cp optional/docker-atlassian-bamboo-postgres.service /etc/systemd/system/.
yes | cp optional/docker-atlassian-bamboo.service /etc/systemd/system/.
systemctl daemon-reload

systemctl enable docker-atlassian-bamboo-postgres
systemctl enable docker-atlassian-bamboo

systemctl start docker-atlassian-bamboo-postgres
systemctl start docker-atlassian-bamboo
echo Done!
