#!/bin/bash
source Express.sh
# Define variables
HOST="$HOST"
USERNAME="$USER"
PASSWORD="$PASSWD"
REMOTE_DIR="$DIRECTORY"
FILE_DIRECTORY="$FILE"

# Transfer file to remote server
sftp $USERNAME@$HOST 
$PASSWORD
cd "$REMOTE_DIRECTORY"
put "$FILE_DIRECTORY"