#!/bin/sh

# Author: Nitin Maiya 

if [ $# -ne 2 ];
then
	echo "ERROR: Total number of args should be 2."
	echo "1. Directory 2. Text string to be searched."  
	exit 1
fi

if [ ! -d "$1" ];
then
	echo "Directory does not exist."
	exit 1
fi 

filesdir=$1
searchstr=$2

num_files=$(find "$filesdir" -type f | wc -l)
num_matches=$(grep -r "$searchstr" "$filesdir" | wc -l)

echo "The number of files are $num_files and the number of matching lines are $num_matches"
