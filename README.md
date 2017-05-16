# atlassian-bamboo
Restartable, persistent docker image for atlassian bamboo

Any feedback let me know - its all welcome!

# Pre-req

Before running this docker image, please [clone / download the repo](https://github.com/blofse/atlassian-bamboo), inlcuding the script files.

# How to use this image
## Initialise

Run the following command, replacing *** with your desired db password:
```
./initial_start.sh '***'
```
This will setup two containers: 
* atlassian-bamboo-postgres - a container to store your bamboo db data
* atlassian-bamboo - the container containing the bamboo server

Once setup, please use the following for DB connectivity:
* DB host: pgbamboo
* DB user: bamboo
* DB database: bamboo
* DB password: ****

## (optional) setting up as a service

Once initialised and perhaps migrated, the docker container can then be run as a service. 
Included in the repo is the service for centos 7 based os's and to install run:
```
./copy_install_and_start_as_service.sh
```
