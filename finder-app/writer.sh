#!/bin/sh

# Author: Nitin Maiya 

if [ $# -ne 2 ];
then
	echo "ERROR: Total number of args should be 2."
	echo "1. File path 2. Data to write."  
	exit 1
fi

writefile=$1
writestr=$2

mkdir -p "$(dirname $writefile)" && touch "$writefile"

echo "$writestr" > "$writefile"

if [ $? -ne 0 ]; then
	echo "Write failed."
	exit 1
fi

