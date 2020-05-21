#!/bin/bash

USAGE="Usage: $(basename "$0") <file> <delimiter>

Get the column names from the first row of a delimited file."

if [[ $# -eq 0 ]] ; then
    echo "$USAGE"
    exit 0
fi

read -r line <"$1"
IFS="$2" read -ra var <<< "$line"
for i in "${var[@]}"; do
  echo "$i"
done
