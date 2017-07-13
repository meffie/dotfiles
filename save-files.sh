#!/bin/bash
# Move files out of the way.
set -e
for file in "$@"; do
    if [ -f $file -a ! -h $file -a -f ${file}.save ]; then
        echo "${file}.save already present" >&2
        exit 1
    fi
done
for file in "$@"; do
    if [ -f $file -a ! -h $file ]; then
        mv $file ${file}.save
    fi
done
