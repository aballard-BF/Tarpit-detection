#!/bin/bash

_host="$1"
_port="$2"

[ $# -eq 0 ] && { echo "Usage: $0 host port"; exit 1; }
[ $# -eq 1 ] && { echo "Usage: $0 host port"; exit 1; }

echo "test" | nc -q 1 "$_host" "$_port" > file.txt 2>&1

MAX=50
FILESIZE=$(wc -c "file.txt" | awk '{print $1}')
if (( FILESIZE < MAX))  
then
	echo "Seems like a tarpit or down"
else
	echo "Seems legit"
fi

rm file.txt



