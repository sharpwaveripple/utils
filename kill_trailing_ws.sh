#!/bin/bash

USAGE="Usage: $(basename "$0") <file>

Removes trailing whitespaces from <file>."

if [[ $# -eq 0 ]] ; then
    echo "$USAGE"
    exit 0
fi

sed 's/^[ \t]*//;s/[ \t]*$//' < $1
