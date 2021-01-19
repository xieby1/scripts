#!/bin/bash
ABS_REVEAL_URL=~/Documents/Notes/xiebenyi/CrossPlatformTools/reveal.js
TEMPLATE=~/Documents/Notes/xiebenyi/CrossPlatformTools/pandoc_revealjs.template

ABS_MD_PATH=$(realpath $1)
REL_REVEAL_URL=$(realpath --relative-to="${ABS_MD_PATH%/*}" "${ABS_REVEAL_URL}")

pandoc \
    -t revealjs \
    -s \
    $1 \
    -o ${1%.*}.html \
    -V revealjs-url=${REL_REVEAL_URL} \
    --template=${TEMPLATE}
