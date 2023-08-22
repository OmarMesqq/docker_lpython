#!/bin/bash 

docker stop lpython-container
docker rm lpython-container
docker rmi lpython-image
