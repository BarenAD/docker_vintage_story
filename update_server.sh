#!/bin/sh

#First param - server download link

if [ -z "$1" ]; then

  read -p "Set URL_FOR_DOWNLOAD_ARCHIVE_TAR_GZ: " downloadUrl

  else

  downloadUrl=$1

fi

echo "Updating server..."

sudo docker exec vintage_story_server bash -c "vs_server_update $downloadUrl"

echo "Restart container..."

sudo docker restart vintage_story_server

echo "Successfully completed!"
