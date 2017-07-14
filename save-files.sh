#!/bin/bash
# Move files and directories out of the way.
set -e
for name in "$@"; do
    if [ -e $name -a ! -h $name -a -e ${name}.save ]; then
        echo "${name}.save already present" >&2
        exit 1
    fi
done
for name in "$@"; do
    if [ -e $name -a ! -h $name ]; then
        echo "WARNING: moving ${name} to ${name}.save"
        mv $name ${name}.save
    fi
done
