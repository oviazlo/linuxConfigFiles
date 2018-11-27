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
    if [ "$CONFIG" = "SL6" -a "$filename" = "vimrc" ]; then
        sed -i 's/let g:ycm_server_python_interpreter = "python3"/let g:ycm_server_python_interpreter = "python2"/' ~/.$filename
    fi
done
