#!/bin/bash

if [ -d "./dist" ]; then
  echo "Cleanup dist"
  sudo rm -R ./dist
fi

mkdir ./dist

echo "Create scripts archive"

cd ./src/scripts && tar -zcvf ../../dist/scripts.tar.gz *

echo "Prepare successfully completed!"
