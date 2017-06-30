#!/bin/bash
# Export some ENV variables so you don't have to type anything
export AWS_ACCESS_KEY_ID="IAM_USER_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="IAM_USER_SECRET_ACCESS_KEY"
export PASSPHRASE="GPG_OR_SOME_OTHER_PASSPHRASE"

# The S3 destination followed by bucket name
DEST="s3://s3.amazonaws.com/example.com/"

# The source of your backup
SOURCE=/
# Your GPG key
#GPG_KEY=YOUR_GPG_KEY

duplicity verify -v4 ${DEST} ${SOURCE}\
    --include=/var/www \
    --include=/etc \
    --include=/home \
    --include=/root \
    --exclude=/** \
    --exclude=/root/.cache 

# Reset the ENV variables. Don't need them sitting around
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset PASSPHRASE

