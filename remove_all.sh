#!/bin/bash

echo Stopping/removing services
systemctl stop docker-atlassian-bamboo-postgres
systemctl stop docker-atlassian-bamboo

systemctl disable docker-atlassian-bamboo-postgres
systemctl disable docker-atlassian-bamboo

if [ -f /etc/systemd/system/docker-atlassian-bamboo.service ]; then
  rm -fr /etc/systemd/system/docker-atlassian-bamboo.service
fi
if [ -f /etc/systemd/system/docker-atlassian-bamboo-postgres.service ]; then
  rm -fr /etc/systemd/system/docker-atlassian-bamboo-postgres.service
fi

systemctl daemon-reload

echo Kill/remove docker images
docker stop atlassian-bamboo-postgres || true && docker rm atlassian-bamboo-postgres || true
docker stop atlassian-bamboo || true && docker rm atlassian-bamboo || true

echo Removing volumes
docker volume rm BambooPostgresData || true
docker volume rm BambooHomeVolume || true

echo Removing networks
docker network rm BambooNetwork || true

echo Done!