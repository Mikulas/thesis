#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# TODO:
# - reloadnout opcache

rsync -avzh "$DIR/" www-data@webserver-plain:/srv/p2/
