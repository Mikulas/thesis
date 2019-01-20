#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

grep '^@' library.bib | grep --only-matching "{.*$" | sed -e 's/[{]/\\cite{/g' -e 's/,/}/g' > citations.aux

awk 'x==0 {print} /%MARK:citations/ {x=1}' library-test.tex > lib-pre.aux
awk 'x==1 {print} /%MARK:citations/ {x=1}' library-test.tex > lib-post.aux

cat lib-pre.aux citations.aux lib-post.aux > library-test.compiled.tex
arara library-test.compiled.tex
open -a /Applications/Skim.app library-test.compiled.pdf
