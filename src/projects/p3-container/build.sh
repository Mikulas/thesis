#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

REGISTRY="registry.gitlab.ditemiku.local:4567"
LATEST="$REGISTRY/root/project-3:latest"
TAG="$REGISTRY/root/project-3:$CI_COMMIT_SHA"

echo "CVUT_FIT" | docker login --username root --password-stdin "$REGISTRY"
docker build -t "$LATEST" .
docker push "$LATEST"

docker tag "$LATEST" "$TAG"
docker push "$TAG"
