# atlassian-bamboo - A docker image containing version 6.0.3 based on alpine linux
Restartable, persistent docker image for atlassian bamboo

Any feedback let me know - its all welcome!

# Pre-req

Before running this docker image, please [clone / download the repo](https://github.com/blofse/atlassian-bamboo), inlcuding the script files.

# How to use this image
## (optional) build docker image

To build the local docker image for bamboo, run the following command:

```
./optional/build_local.sh
```

## Initialise

Run the following command, replacing *** with your desired db password:

```
./initial_start.sh '***'
```

This will setup:
* Two containers: 
	* atlassian-bamboo-postgres - a container to store your bamboo db data
	* atlassian-bamboo - the container containing the bamboo server
* Two Volumes:
	* atlassian-bamboo-postgres-data - a volume for postgres directory /var/lib/postgresql/data
	* atlassian-bamboo-home - a volume for bamboo application data
* A network:
	* atlassian-bamboo-network - a bridge network for bamboo

Once setup, please use the following for DB connectivity:
* DB host: atlassian-bamboo-postgres
* DB user: bamboo
* DB database: bamboo
* DB password: ****

## (optional) setting up as a service

Once initialised and perhaps migrated, the docker container can then be run as a service. 
Included in the repo is the service for centos 7 based os's and to install run:

```
./optional/copy_install_and_start_as_service.sh
```

## (optional) remove all (for this image)

Running the command below will remove all trace of this docker image, services, containers, volumes and networks:

```
./optional/remove_all.sh
```

