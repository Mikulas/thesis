#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

./preprocess.sh -D'NOTODO=1'
echo "Building version without TODOs"
make quick >/dev/null
pdftotext MT_Dite_Mikulas_2019.pdf
LINES_DONE="$(wc -l MT_Dite_Mikulas_2019.txt | awk '{print $1}')"

./preprocess.sh -D'TODO=1'
echo "Building version with TODOs"
make quick >/dev/null
pdftotext MT_Dite_Mikulas_2019.pdf
LINES_TODO="$(wc -l MT_Dite_Mikulas_2019.txt | awk '{print $1}')"

PERCENT="$(bc <<< "scale=2; $LINES_DONE/$LINES_TODO*100")"
echo "$LINES_DONE / $LINES_TODO ($PERCENT %)"

echo "$(date '+%Y-%m-%d %H:%M:%S'),$PERCENT,$LINES_DONE,$LINES_TODO" >> progress.csv

rm main.tex MT_Dite_Mikulas_2019.txt
