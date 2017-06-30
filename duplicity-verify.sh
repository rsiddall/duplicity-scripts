#!/bin/bash

source "/usr/local/etc/duplicity-backup.cfg"

# Export some ENV variables so you don't have to type anything
export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export PASSPHRASE

duplicity verify -v4 ${DEST} ${SOURCE} \
	--include-globbing-filelist=/usr/local/etc/duplicity-backup.list

# Reset the ENV variables. Don't need them sitting around
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset PASSPHRASE

