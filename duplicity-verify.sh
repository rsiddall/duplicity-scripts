#!/bin/bash

source "/usr/local/etc/duplicity-backup.cfg"

# Export some ENV variables so you don't have to type anything
export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export PASSPHRASE

    if [ "${GPG_KEY}x" != "x" ]; then
        GPG_SWITCH="--encrypt-key=${GPG_KEY} --sign-key=${GPG_KEY}"
    else
        GPG_SWITCH="--no-encryption"
    fi

duplicity verify -v4 --include-globbing-filelist=/usr/local/etc/duplicity-backup.list \
        ${GPG_SWITCH} \
	${DEST} ${SOURCE}

# Reset the ENV variables. Don't need them sitting around
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset PASSPHRASE

