#!/bin/bash

_host="$1"
_port="$2"

[ $# -eq 0 ] && { echo "Usage: $0 host port"; exit 1; }
[ $# -eq 1 ] && { echo "Usage: $0 host port"; exit 1; }

echo "test" | nc -q 1 "$_host" "$_port" > file.txt 2>&1

if [ -s "file.txt" ]
then
	echo "Seems legit"
else
	echo "Seems like a tarpit or down"
fi

rm file.txt



