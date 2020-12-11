#!/bin/bash
# Color according to https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux

# const value
RED="\033[0;31m"
CYAN="\033[0;36m"
WHITE="\033[0;37m"
NC="\033[0m"
#default value
DIR=./

if [[ -n $1 ]]; then
    if [[ "$1" == "-h" ]]; then
        echo "Usage: ${0##*/} [DIR]"
        echo
        echo "  mr register all repos in DIR into mrconfig file"
        echo "  if DIR is not specified, '.' will be used"
        echo "  the default mrconfig is ~/.mrconfig"
        exit 0;
    fi
    DIR=$1
fi

for REPO in ${DIR}/*; do
    if [[ -d "${REPO}" ]]; then # if this REPO is a directory
        mr register "${REPO}" &> /dev/null
        case $? in
            0)
                ;;
            1)
                echo -e "cannot determine url: ${RED}${REPO}${NC}"
                ;;
            2)
                echo -e "unknown repo: ${CYAN}${REPO}${NC}"
                ;;
            *)
                echo -e "unknown return num $?: ${WHITE}${REPO}${NC}"
                ;;
        esac
    fi
done
