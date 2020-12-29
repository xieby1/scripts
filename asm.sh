#/bin/bash
# input: native assmblies
# output: native machine codes
echo -e "$1" | as -al -o /dev/null
