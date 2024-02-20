#!/bin/bash

source Express.sh

p=$port
f="$file"

echo "Waiting for connection on port $port"
nc -l -p $p | (
    # Read the first line, which contains the file name
    read -r filename

    # Read the remaining data and save it to the file
    cat > "$filename"

    echo "File received: $filename"
)