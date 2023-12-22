#!/bin/sh

#First param - server download link

if [ -z "$1" ]; then

	echo "URL params is empty. call update_server.sh <URL_FOR_DOWNLOAD_ARCHIVE_TAR_GZ>"
	exit

fi

echo "Updating server..."

sudo docker exec vintage_story_server bash -c "vs_update $1"

echo "Restart container..."

sudo docker restart vintage_story_server

echo "Successfully completed!"
