#!/bin/bash
source Express.sh
# Define variables
HOST="$HOST"
USERNAME="$USER"
PASSWORD="$PASSWD"
REMOTE_DIR="$DIRECTORY"
FILE_DIRECTORY="$FILE"

# Transfer file to remote server
sftp $USERNAME@$HOST <<EOF
cd $REMOTE_DIR
put $FILE_DIRECTORY
bye
EOF
