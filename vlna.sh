#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

while IFS= read -r -d $'\0' FILE; do
    vlna -l -m -n "$FILE"
    rm "${FILE//.tex/.te~}"
done < <(find "$DIR" -name "*.tex" -type f -print0)
