#!/bin/bash
# input: the file (or diretory) to be examed,
# output: its (or files under the directory, recursively) depending lib
for opt in $@; do
    if [[ ${opt} == "-h" || ${opt} == "--help" ]]; then
        echo "Usage: ${0##*/} [ file | directory ]"
        echo
        echo "  List the lib dependencies of file or files under directory"
        echo "  If file or directory is not specified, '.' will be used."
        exit 0
    fi
done

ldd_real_path()
{
    ldd "$1" 2> /dev/null |\
        sed 's/.*=>//' |\
        grep -E -o '\/.*\s' |\
        sed 's/\s//'
}

TARGET=.
if [[ $# -ge 1 ]]; then
    TARGET=$1
fi

if [[ -d ${TARGET} ]]; then
    for file in $(find .); do
        ldd_real_path ${file}
    done
elif [[ -f ${TARGET} ]]; then
    ldd_real_path $1
fi
