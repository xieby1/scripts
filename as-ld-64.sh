#!/bin/bash
NAME=$1
# modify input with suffix like "filename.s"
if [[ "." == "${NAME:(-2):1}" ]]; then
    NAME="${NAME::-2}"
fi
# modify input end by a '.' like "filename."
if [[ "." == "${NAME:(-1):1}" ]]; then
    NAME="${NAME::-1}"
fi

as "$NAME.s" -o "$NAME.o"
ld "$NAME.o" -o "$NAME"
