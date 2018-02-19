#!/bin/bash

if [[ $# -eq 0 ]] ; then
  echo 'Expecting one argument'
  exit 0
fi

docker network create \
  --driver bridge \
  atlassian-bamboo-network

docker run \
  --name atlassian-bamboo-postgres \
  -e POSTGRES_USER=bamboo \
  -e POSTGRES_PASSWORD="$1" \
  -v atlassian-bamboo-postgres-data:/var/lib/postgresql/data \
  --net atlassian-bamboo-network \
  -d \
  postgres:9.5.6-alpine

docker run \
  --name atlassian-bamboo \
  -p 8085:8085 \
  -p 16001:16001 \
  -p 16002:16002 \
  -p 7222:7222 \
  -v atlassian-bamboo-home:/var/atlassian/application-data/bamboo \
  -v atlassian-bamboo-serverconf:/opt/atlassian/bamboo/conf \
  -v atlassian-bamboo-maven:/home/bamboo/.m2 \
  --net atlassian-bamboo-network \
  -d \
  atlassian-bamboo
