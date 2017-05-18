#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Expecting one argument'
    exit 0
fi

docker run --name atlassian-bamboo-postgres -e POSTGRES_USER=bamboo -e POSTGRES_PASSWORD="$1" -v BambooPostgresData:/var/lib/postgresql/data -d postgres:9.5.6-alpine
docker run -d --name atlassian-bamboo --link atlassian-bamboo-postgres:pgbamboo -p 8085:8085 -v BambooHomeVolume:/var/atlassian/application-data/bamboo atlassian-bamboo
