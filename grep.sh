#!/bin/bash
grep --color=always "$1" . -r -I \
    --exclude="*.html" \
    --exclude="*.js" \
    --exclude="*.svg" \
    --exclude="*.obj" \
    --exclude="*.json" \
    --exclude="*.drawio" \
    --exclude="*.css" \
    --exclude-dir="expm" \
    --line-number \
    "${@:2}"
