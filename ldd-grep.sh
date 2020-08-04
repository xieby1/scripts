#!/bin/bash
# input the file to be examed, output its related lib
list="$(ldd "$1" | grep -E -o '\/lib.*\.[0-9]+')"
echo "${list}"
