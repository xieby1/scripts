#!/bin/bash
# Color according to https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
RED="\033[0;31m"
CYAN="\033[0;36m"
NC="\033[0m"
DIR=./
if [[ -n $1 ]]; then
    DIR=$1
fi
ls "${DIR}" | while read REPO; do
    if [[ -d "${REPO}" ]]; then # if this REPO is a directory
        mr register "${REPO}" > /dev/null
        #if   [[ $? -eq 1 ]]; then # cannot determine url
        #    echo "${RED}${REPO}${NC}"
        #elif [[ $? -eq 2 ]]; then # unknown repo
        #    ehcp "${CYAN}${REPO}${NC}"
        #fi
        if [[ $? -ne 0 ]]; then
            echo "${REPO}"
        fi
    fi
done
