#!/bin/bash
if [[ $1 == "-h" ]]; then
    echo "${0#"./"}: rsync un-staged changes in local git repository to host"
    echo "  Usage: ${0#"./"} [[local_dir] host_dir]"
    echo "TODO: to make use of ssh host dir auto complete"
fi
host="my3a"
local_home="/home/xieby1"
host_home="${local_home}"
if [[ $# -eq 2 ]]; then
    local_path=$1
else
    local_path="."
fi
local_path=$(realpath ${local_path})
local_path=${local_path#${local_home}}
if [[ $# -eq 1 ]]; then
    host_path=$1
elif [[ $# -eq 2 ]]; then
    host_path=$2
else
    host_path=${local_path}
fi

git status | grep "modified:" | sed 's/\s*modified:\s*//' | while read -r file; do
    rsync -v \
        "${local_home}/${local_path}/${file}" \
        "${host}:${host_home}/${host_path}/${file}"
done
