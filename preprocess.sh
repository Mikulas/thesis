#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function finish() {
    rm main.c
}
trap finish exit

cp main.ctex main.c
gcc "$@" -E main.c -o main.tex 2>/dev/null
sed -i '' 's/^# .*//g' main.tex
