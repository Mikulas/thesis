#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

REGISTRY="registry.gitlab.ditemiku.local:4567"

cd "$DIR"

echo "CVUT_FIT" | docker login --username root --password-stdin "$REGISTRY"
docker stack deploy --with-registry-auth -c /srv/p3/stack.yml p3
