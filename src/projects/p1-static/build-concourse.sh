#!/usr/bin/env bash
set -euvo pipefail
IFS=$'\n\t'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

SITE_DIR="$PWD/_site"
mkdir -p "$SITE_DIR"
chmod ugo+rwX "$SITE_DIR"

cd "$DIR"
bundle install
bundle exec jekyll build --destination "$SITE_DIR"

ls -lA "$SITE_DIR"
ls -lA "$SITE_DIR/assets"

HASH="$(cat "$SITE_DIR/assets/hash.txt")"

mv "$SITE_DIR/assets" "$SITE_DIR/$HASH"
mkdir -p "$SITE_DIR/assets"
mv "$SITE_DIR/$HASH" "$SITE_DIR/assets/$HASH"
