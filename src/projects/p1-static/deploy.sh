#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rsync -avzh "$DIR/_site/" www-data@webserver-plain:/srv/p1/
