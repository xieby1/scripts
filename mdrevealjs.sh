#!/bin/bash
REVEAL_URL=~/Documents/Notes/xiebenyi/CrossPlatformTools/reveal.js
TEMPLATE=~/Documents/Notes/xiebenyi/CrossPlatformTools/pandoc_revealjs.template

pandoc \
    -t revealjs \
    -s \
    $1 \
    -o ${1%.*}.html \
    -V revealjs-url=${REVEAL_URL} \
    --template=${TEMPLATE}
