#!/bin/bash

set -euo pipefail

yamlFile="docker-compose.yml"

if [ $(find . -name "$yamlFile" | wc -l) -eq 0 ]; then
  # docker compose file not found
  exit 1
fi

path=$(pwd)

while [[ "$path" != "" && -f "$path/$yamlFile" ]]; do
  path=${path%/*}
done
cd "$path"

docker-compose $(for file in $(find . -name "$yamlFile"); do echo "-f $file "; done) "$@"
