#!/usr/bin/env bash
set -euvo pipefail
IFS=$'\n\t'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

REMOTE="www-data@webserver-plain"

# todo je potreba nastavit env file

echo "Uploading sources"
rsync -avzh "$DIR/" "$REMOTE:/srv/p2/"

echo "Running post deploy scripts"
ssh "$REMOTE" -- bash /srv/p2/post-deploy.sh
