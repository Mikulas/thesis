#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

T=$'`'

echo "Biber:"
cat main.blg | \
    grep -v " INFO " \
    || echo '✅ all ok'

echo ""
echo "Tex:"
awk '/^File: assignment\.pdf/ { found = 1 } found { print }' main.log | \
    egrep "Warning|Error|Emergency|Undefined control sequence|Illegal parameter|<argument>|Orphan on page|Widow on page" | \
    grep -v 'glossarystyle' | \
    grep -v 'Token not allowed in a PDF' | \
    grep -v 'Some font shapes were not available' | \
    grep -v "Font shape ${T}TU/lmss/bx/sc' undefined" | \
    grep -v "Name format 'last-first' deprecated." \
    || egrep -A 3 'Emergency|Illegal' main.log \
    || echo '✅ all ok'
