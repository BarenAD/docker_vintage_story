#!/bin/sh

echo "Run container"

sudo docker stop vintage_story_server && docker rm vintage_story_server

sudo docker run -d --name vintage_story_server -p 42420:42420 --restart=unless-stopped -e TZ=Asia/Novosibirsk -v vintage_story_server:/var/vintage_story barenad/vintage_story_server:any_net_7

sudo docker volume ls

sudo docker ps -a

echo "Successfully completed!"
