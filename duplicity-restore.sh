#!/bin/bash

source "/usr/local/etc/duplicty-backup.cfg"

# Export some ENV variables so you don't have to type anything
export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export PASSPHRASE

# Display usage unless required parameters passed on command line
if [ $# -lt 3 ]; then echo "Usage $0 <date> <file> <restore-to>"; exit; fi

duplicity \
    --restore-time $1 \
    --file-to-restore $2 \
    ${DEST} $3

# Reset the ENV variables. Don't need them sitting around
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset PASSPHRASE

