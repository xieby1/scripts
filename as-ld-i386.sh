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

as --32 "$NAME.s" -o "$NAME.o"
ld -m elf_i386 "$NAME.o" -o "$NAME"
