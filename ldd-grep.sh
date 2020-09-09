#!/bin/bash
# input: the file (or diretory) to be examed,
# output: its (or files under the directory, recursively) depending lib

# default value
TARGET=.

while [[ ${OPTIND} -le $# ]]; do
    getopts "ho:" opt
    case "${opt}" in
        h)
            echo "Usage: ${0##*/} [-o dir] [ file | directory ]"
            echo
            echo "  List the lib dependencies of file or files under directory"
            echo "  If file or directory is not specified, '.' will be used."
            exit 0
            ;;
        ?)
            TARGET=${!OPTIND}
            shift
            ;;
        *)
            echo "unknown options arg${OPTIND} ${OPTARG}"
            exit 1
            ;;
    esac
done

ldd_real_path()
{
    ldd "$1" 2> /dev/null |\
        sed 's/.*=>//' |\
        grep -E -o '\/.*\s' |\
        sed 's/\s//'
}

if [[ -d ${TARGET} ]]; then
    for FILE in $(find .); do
        ldd_real_path ${FILE}
    done
elif [[ -f ${TARGET} ]]; then
    ldd_real_path ${TARGET}
fi
