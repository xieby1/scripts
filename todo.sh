#/bin/bash
# This is a script designed only for myself (xieby1), which depends on
# the directory structure.
# This script is meant to find and list all todo/open entries in my notes
# as much as possible.

source ~/Codes/MyRepos/scripts/_common.sh
source ~/Codes/MyRepos/scripts/_grep_common.sh

#### Local Variables ####
TODO_OPTION=(-i -E -w)
BAT_STYLE=--style="grid,numbers"
GREP_OPTIONS=(
    . -r
    ${EXTRA_OPTION[@]}
    ${TODO_OPTION[@]}
    ${EXCLUDE_BASIC[@]}
    ${EXCLUDE_CODE[@]}
)
#### End of Local Variables ####

cd ~/Documents/Notes/xiebenyi
head_line Notes
EXCLUDE_TODO=(
    --exclude="*todo.txt"
    --exclude="*done.txt"
    --exclude-dir="CrossPlatformTools"
)
grep "todo" ${GREP_OPTIONS[@]} \
    ${EXCLUDE_TODO[@]} \
    | bat ${BAT_STYLE}
grep "\[open\]" ${GREP_OPTIONS[@]} \
    ${EXCLUDE_TODO[@]} \
    | bat ${BAT_STYLE}

head_line todo.txt
bat "${BAT_STYLE}" "./todo.txt"

cd ~/Documents/Essays
cd "${LOCATION}"
head_line Essays
find -iname "W.*" \
    | bat ${BAT_STYLE}
grep "todo" ${GREP_OPTIONS[@]} \
    | bat ${BAT_STYLE}

cd ~/Documents/Hobbies
head_line Hobbies
grep "todo" ${GREP_OPTIONS[@]} \
    --exclude="awesome-kernel.md" \
    | bat ${BAT_STYLE}
find -iname "W.*" \
    | bat ${BAT_STYLE}
