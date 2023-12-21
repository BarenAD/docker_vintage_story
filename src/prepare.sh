#!/bin/sh

if [ -f ./dist/scripts.tar.gz ]; then

	echo "Cleanup scripts"

	rm ./dist/scripts.tar.gz

fi

echo "Create scripts archive"

cd ./src/scripts && tar -zcvf ../../dist/scripts.tar.gz *

echo "Prepare successfully completed!"
