#!/bin/sh

echo "Cleanup dist..."

rm -r ./dist

echo "Cleanup container..."

sudo docker stop vintage_story_server && docker rm vintage_story_server

echo "Cleanup image..."

sudo docker rmi barenad/vintage_story_server:any_net_7

echo
echo "Result:"
echo
echo

sudo docker ps -a

echo

sudo docker images

echo

sudo docker volume ls

echo

echo "Successfully completed!"
