#/bin/bash
# This is a script designed only for myself (xieby1), which depends on
# the directory structure.
# This script is meant to find and list all todo/open entries in my notes
# as much as possible.

source ~/Documents/shell-scripts/_common.sh
source ~/Documents/shell-scripts/_grep_common.sh

#### Local Variables ####
TODO_OPTION=(-i -E -w)
BAT_STYLE=--style="grid,numbers"
EXCLUDE_TODO=(
    --exclude="*todo.txt"
    --exclude="*done.txt"
    --exclude-dir="CrossPlatformTools"
)
GREP_OPTIONS=(
    . -r
    ${EXTRA_OPTION[@]}
    ${TODO_OPTION[@]}
    ${EXCLUDE_BASIC[@]}
    ${EXCLUDE_CODE[@]}
    ${EXCLUDE_TODO[@]}
)
#### End of Local Variables ####

cd ~/Documents/Notes/xiebenyi
head_line Notes
grep "todo" ${GREP_OPTIONS[@]} \
    | bat "${BAT_STYLE}"
grep "\[open\]" ${GREP_OPTIONS[@]} \
    | bat "${BAT_STYLE}"


head_line todo.txt
bat "${BAT_STYLE}" "./todo.txt"

PATTERN="W.*"
LOCATION=~/Documents/Essays
cd "${LOCATION}"
head_line Essays
find -iname "${PATTERN}" \
    | bat "${BAT_STYLE}"
grep "todo" ${GREP_OPTIONS[@]} \
    | bat "${BAT_STYLE}"
