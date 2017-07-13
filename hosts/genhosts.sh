#!/bin/bash
# Include custom /etc/hosts entries.
set -e
cat /etc/hosts | perl -lne 'print unless /### BEGIN CUSTOM ###/ .. /### END CUSTOM ###/'
echo '### BEGIN CUSTOM ###'
cat hosts.d/*
echo '### END CUSTOM ###'
