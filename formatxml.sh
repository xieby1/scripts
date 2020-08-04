#!/bin/bash
NAME=$1
ORIGINAL="$1.svg"
FORMATTED="$1-formatted.svg"
xmllint --format $ORIGINAL > $FORMATTED
