#!/bin/bash

source Express.sh

p=$port

echo "Waiting for connection on port $port"
nc -l -p $p | (
    # Read the first line, which contains the file name
    read -r f

    # Read the remaining data and save it to the file
    cat > "$f"

    echo "File received: $f"
)