#!/bin/bash
# ability to ignore some file
find . \( ! -regex '.*/\..*' \) -type f
