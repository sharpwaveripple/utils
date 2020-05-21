#!/usr/bin/env bash

USAGE="Usage: $(basename "$0") <file1> <file2>

Find difference between lines in two files.
E.g. to find lines in file1 that are not in file2."

if [[ $# -eq 0 ]] ; then
    echo "$USAGE"
    exit 0
fi

grep -Fxv -f "$1" "$2"
