#!/bin/bash

home=$(docker volume inspect --format '{{ .Mountpoint }}' atlassian-bamboo-home)

echo Home Volume location is $home
mkdir -p backup
cp $home/exports/export_*.zip backup/.

echo Backup complete

