#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$DIR"

echo "Running migrations"
php bin/console migrations:continue

echo "Reloading opcache"
sudo systemctl reload php7.2-fpm
