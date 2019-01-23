#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function count-lines() {
    gsed -e '/MARK-START/,/MARK-END/{//!d}' main.txt | wc -l | awk '{print $1}'
}

./preprocess.sh -D'NOFIGURE=1'
echo "Building version without TODOs"
echo "" | xelatex -shell-escape main >/dev/null
pdftotext main.pdf
LINES_DONE="$(count-lines)"

./preprocess.sh -D'TODO=1' -D'NOFIGURE=1'
echo "Building version with TODOs"
echo "" | xelatex -shell-escape main >/dev/null
pdftotext main.pdf
LINES_TODO="$(count-lines)"

PERCENT="$(bc <<< "scale=2; $LINES_DONE/$LINES_TODO*100")"
echo "$LINES_DONE / $LINES_TODO ($PERCENT %)"

TAB=$'\t'
echo "$(date '+%Y-%m-%d %H:%M:%S')$TAB$LINES_DONE$TAB$LINES_TODO" >> progress.csv

rm main.txt
