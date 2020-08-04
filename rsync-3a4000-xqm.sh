#!/bin/bash
pwd | sed 's/\/home\/xieby1\///' | while read -r path;do
    git status | grep "modified:" | sed 's/\s*modified:\s*//' | while read -r file; do
        rsync -v "/home/xieby1/${path}/${file}" "3a4000$1:/home/xiebenyi/${path}/${file}"
    done
done
