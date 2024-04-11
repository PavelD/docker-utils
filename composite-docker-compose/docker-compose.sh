#!/bin/bash

set -euo pipefail

yamlFile="docker-compose.yml"

if [ ! -f "./$yamlFile" ]; then
  echo "ERROR: $yamlFile not found"
  echo
  echo "Run docker compose in the / of $yamlFile tree including all files."
  echo
  echo "Usage:"
  echo "   $0 [docker compose params]"
  exit 1
fi

# find / folder containing $yamlFile
path=$(pwd)
while [[ "$path" != "" && -f "$path/$yamlFile" ]]; do
  path=${path%/*}
done
# change directory to /
cd $path

#run docker compose inclucing all $yamlFiles
docker-compose $(for file in `find . -name $yamlFile`; do echo "-f $file "; done) $@
