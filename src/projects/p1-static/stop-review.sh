#!/usr/bin/env bash
set -euvo pipefail
IFS=$'\n\t'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ssh "www-data@webserver-plain" rm -rf "/srv/p1-$CI_ENVIRONMENT_SLUG"
