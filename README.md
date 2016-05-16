# mesos master on docker
## introduction
This dockerfile aims to run mesos master in docker image.
[Mesos](http://mesos.apache.org/) is an excellent cluster resources management framework.
It provide a isolation between tasks both with Linux Containers and Docker containers.
Mesos slaves responsible for running tasks.In my repo I run Mesos in docker container and mesos tasks in docker containers.

## requirements
- docker
- docker-compose
- zookeeper

## usage
1. clone this repo
```
git clone https://github.com/dockerq/docker-mesos-master.git
```
2. build mesos master docker image
```
docker build -t image_name .
```
3. change image url in docker-compose.yml
```
mesos_master:
    image: your_image_name
    net: "host"
    privileged: true
    volumes:
      - /var/mesos:/var/mesos
    container_name: mesos_master
    env_file: mesos_master_env
```
4. change env in mesos_master_env file
```
...
MESOS_LOGGING_LEVEL=INFO
MESOS_IP=192.168.10.142
...
```
for more configs click [mesos config](http://mesos.apache.org/documentation/latest/configuration/)
5. run mesos master
```
docker-compose -f ./docker-compose.yml up -d
```
