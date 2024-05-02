#!/bin/bash

declare WORK_DIR=~/Documents/docker-compose
declare dc_default=${WORK_DIR}/docker-compose.yml
declare dc_mq=${WORK_DIR}/docker-compose-mq.yml
declare dc_sqube=${WORK_DIR}/docker-compose-sqube.yml

function init(){
	init-sqube
}

function init-sqube(){
  echo "Initializing mysql config(s)...."
  sudo sysctl -w vm.max_map_count=524288
  sudo sysctl -w fs.file-max=131072
  ulimit -n 131072
  ulimit -u 8192
}

function init-mysql(){
    echo "Initializing mysql config(s)...."
    mkdir ${WORK_DIR}/.docker
    mkdir ${WORK_DIR}/.docker/init-db
    cp ${WORK_DIR}/schema/init-db.sql ${WORK_DIR}/.docker/init-db
}

function start() {
	echo "Starting all docker(s) containers...."
	init
	docker compose -f ${dc_default} -f ${dc_mq} -f ${dc_sqube} up --remove-orphans --build -d 
}

function stop(){
	echo "Stopping all docker(s) containers...."
	docker compose -f ${dc_default} -f ${dc_mq} -f ${dc_sqube} stop
	docker compose -f ${dc_default} -f ${dc_mq} -f ${dc_sqube} rm -f
}

function start-mq(){
	echo "Starting message queue(s) docker containers...."
  docker compose -f ${dc_mq} up --build -d
}

function stop-mq(){
	echo "Stopping message queue(s) docker containers...."
  docker compose -f ${dc_mq} stop
  docker compose -f ${dc_mq} rm -f
}

function start-sqube(){
  echo "Starting sonarqube docker containers...."
  init-sqube
  docker compose -f ${dc_sqube} up --build -d
}

function stop-sqube(){
  echo "Starting sonarqube docker containers...."
  docker compose -f ${dc_sqube} down
  docker compose -f ${dc_sqube} rm -f
}

function log(){
    docker compose -f ${dc_default} logs -f
}

function log-mq(){
    docker compose -f ${dc_mq} logs -f
}

function log-sqube(){
    docker compose -f ${dc_sqube} logs -f
}

function remove(){
    echo "Are you sure you want to remove all Docker volumes? (y/n)"
    read -r response
    if [ "$response" = "y" ]; then
        sudo rm -rf ${WORK_DIR}/.docker
        echo "Docker volumes removed successfully."
    else
        echo "Operation canceled."
    fi
}

function purge() {
    echo "Are you sure want to delete network and all empty images (y/n)"
    read -r response
    if [ "$response" = "y" ]; then
        docker rmi $(docker images -f "dangling=true" -q)
        echo "Docker volumes removed successfully."
    else
        echo "Operation canceled."
    fi
}

action="start"

if [[ "$#" != "0"  ]]
then
    action=$@
fi

eval ${action}

