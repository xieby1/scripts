#/bin/bash
# This is a script designed only for myself (xieby1), which depends on
# the directory structure.
# This script is meant to find and list all todo/open entries in my notes
# as much as possible.

source ~/Documents/shell-scripts/_common.sh
source ~/Documents/shell-scripts/_grep_common.sh

TODO_OPTION=(-i -E -w)

PATTERN="(todo)|(\[open\])"
LOCATION=~/Documents/Notes/xiebenyi
cd "${LOCATION}"
head_line Notes
grep "${PATTERN}" . -r \
    ${EXTRA_OPTION[@]} \
    ${TODO_OPTION[@]} \
    ${EXCLUDE_BASIC[@]} \
    ${EXCLUDE_CODE[@]}

head_line todo.txt
cat "${LOCATION}/todo.txt"

PATTERN="W.*"
LOCATION=~/Documents/Essays
cd "${LOCATION}"
head_line Essays
find -iname "${PATTERN}"


