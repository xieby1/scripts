#!/bin/bash
# ls files & directories only contaion in git repo
FILES_IN_GIT=$(git ls-files .)
if [[ $? -ne 0 ]]; then
    exit $?
fi
echo ${FILES_IN_GIT} | \
    tr " " "\n" | \
    sed s,/.*,, | \
    uniq | \
    xargs ls -d --color=auto $*
