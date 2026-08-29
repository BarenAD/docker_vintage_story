#!/bin/bash

mkdir -p dist

echo "Preparing..."

bash ./src/prepare.sh

echo "Cleanup image..."

sudo docker rmi barenad/vintage_story_server:any_net_10

echo "Build..."

sudo docker build . --platform linux/amd64 -t barenad/vintage_story_server:any_net_10

sudo docker images

echo "Successfully completed!"
