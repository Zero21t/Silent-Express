#!/bin/bash
port=""
echo "Waiting for connection on port $port"
nc -l -p $port > encrypted_file.enc


echo "File is revieved: encrypted_file.enc"