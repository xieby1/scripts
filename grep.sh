#!/bin/bash

source ~/Documents/shell-scripts/_grep_common.sh

grep "$1" . -r \
    ${EXTRA_OPTION[@]} \
    ${EXCLUDE_BASIC[@]} \
    ${@:2}
