#!/bin/bash
FILE=$1
iconv -f gb18030 -t utf-8 "$FILE"
