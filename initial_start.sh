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
  -v atlassian-bamboo-home:/var/atlassian/application-data/bamboo \
  -v atlassian-bamboo-serverconf:/opt/atlassian/bamboo/conf \
  --net atlassian-bamboo-network \
  -d \
  atlassian-bamboo
