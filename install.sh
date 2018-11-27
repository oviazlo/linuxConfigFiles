#!/bin/bash

if [ -z "$1" ]; then
	echo "No argument supplied! Choose your setup!"
	echo "[Arch, SL6]"
	exit
else
	LOCAL_FILE="$1"
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

for file in $(find $DIR -name '*.tocopy'); do
	filename=$(basename "$file")
	filename="${filename%.*}"
	cp $file ~/.$filename
done
