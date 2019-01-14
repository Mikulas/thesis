#!/usr/bin/env bash
set -euvo pipefail
IFS=$'\n\t'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

REMOTE="www-data@webserver-plain"

cd "$DIR"

cat docker-compose-prod.yml | envsubst > stack.yml
scp stack.yml "$REMOTE:/srv/p3/stack.yml"

scp remote-deploy.sh "$REMOTE:/srv/p3/remote-deploy.sh"
ssh "$REMOTE" -- bash /srv/p3/remote-deploy.sh
