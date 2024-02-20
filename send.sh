#!/bin/bash
source Express.sh

#define varaibles
SOURCE_FILE="$FILE"
DESTINATION_HOST="$SSH"
DESTINATION_PATH="$PATH"

#Transfer file using SCP
scp "$SOURCE_FILE" "$DESTINATION_HOST":"$DESTINATION_PATH"
