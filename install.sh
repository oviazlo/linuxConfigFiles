#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

for file in $(find $DIR -name '*.tocopy'); do
	filename=$(basename "$file")
	filename="${filename%.*}"
	cp $file ~/.$filename
done
