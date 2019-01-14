#!/bin/bash

CONFIG=""
if [ -z "$1" ]; then
    echo "No argument found! Choose your setup from:"
	echo "[Arch, SL6]"
	exit
else
	CONFIG="$1"
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

for file in $(find $DIR -name '*.tocopy'); do
	filename=$(basename "$file")
	filename="${filename%.*}"
	cp $file ~/.$filename
done
