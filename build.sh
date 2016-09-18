#!/bin/bash
set -eux -o pipefail

test -z "$1" && { echo "Usage: $0 <version tag>"; exit 1; }
readonly tag=$1

CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o gobut .
docker build -t chooper/gobut:$tag -f Dockerfile.scratch .

echo "Publish using \`docker push chooper/gobut\`"
