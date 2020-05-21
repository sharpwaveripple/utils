#!/bin/bash

USAGE="Usage: $(basename "$0") <file> <start> <end>

Get lines from a file from start:end."

if [[ $# -eq 0 ]] ; then
    echo "$USAGE"
    exit 0
fi

file=$1
line1=$2
line2=$3

sed -n "${line1},${line2}p" "${file}"
