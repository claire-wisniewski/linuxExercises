#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory> <n_bytes>" 1>&2
    exit 1
fi

DIR=$1
N=$2

if [ ! -d "$DIR" ]; then
    echo "Error: $DIR is not a directory" 1>&2
    exit 1
fi

find "$DIR" -type f -size +"${N}c" -exec rm {} \;
