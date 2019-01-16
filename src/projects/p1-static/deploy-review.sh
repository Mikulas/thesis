#!/usr/bin/env bash
set -euvo pipefail
IFS=$'\n\t'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# TODO udelat to podle toho jako je to v praci:
# - nejdriv nahrat assety
# - az potom nahrat html

rsync -avzh "$DIR/_site/" "www-data@webserver-plain:/srv/p1-$CI_ENVIRONMENT_SLUG"
