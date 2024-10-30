#!/bin/bash

set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "ERROR: Illegal number of parameters"
  echo
  echo "Find docker image parent"
  echo
  echo "Usage:"
  echo "   $0 DOCKER_IMAGE_ID"
  exit 1
fi

parent=$(docker inspect -f '{{.Id}}' "$1")

for id in $(docker inspect -f '{{.Id}} {{.Parent}}' $(docker images -a -f since="$parent" -q) | awk -v parent="$parent" '{ if($2 == parent) print $1 }'); do
  "$0" "$id"
  docker images | grep $(echo "$id" | cut -c 8-19)
done
