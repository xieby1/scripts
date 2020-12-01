#!/bin/bash
EXTRA_OPTION=(
    --color=always
    --line-number
)

EXCLUDE_BASIC=(
    -I 
    --exclude="*.html" 
    --exclude="*.js" 
    --exclude="*.svg" 
    --exclude="*.obj" 
    --exclude="*.json" 
    --exclude="*.drawio" 
    --exclude="*.xml"
    --exclude="*.css" 
    --exclude-dir="expm"
    --exclude-dir=".git"
)
EXCLUDE_CODE=(
    --exclude="*.py")
