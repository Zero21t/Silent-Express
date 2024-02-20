#!/bin/bash

source Express.sh
ip="$IP"
p=$port
f="$file"

echo "$f" | nc "$ip" "$p"
cat $f | nc "$ip" "$p"