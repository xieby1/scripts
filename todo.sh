#/bin/bash
grep.sh \
    "(todo)|(\[open\])" \
    ${@:1} \
    -i -E -w \
    --exclude="*.py"
