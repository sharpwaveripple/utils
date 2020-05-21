#!/bin/bash

USAGE="Usage: $(basename "$0") <delimiter> <colnum> <file>

Get a column from a delimited file.
Eg. To get the second column from a csv, do
$0 , 2 file.csv"

if [[ $# -eq 0 ]] ; then
    echo "$USAGE"
    exit 0
fi

cut -d"$1" -f"$2" < "$3"
