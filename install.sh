#!/bin/bash
SUPPORTED_ARCHS=["Arch","SL6"]

CONFIG=""
if [ -z "$1" ]; then
    echo "No argument found! Choose your setup from:"
	echo $SUPPORTED_ARCHS
	exit
else
	CONFIG="$1"
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

DIRS=()
for FILE in $DIR/*; do
    if [ -d $FILE ]; then
        for FILE_DEEP in $FILE/*; do
            [[ -d $FILE_DEEP ]] && DIRS+=("$FILE_DEEP")
        done
    fi
done

# copy all dot-files to user home directory
echo "Copying following files:"
for file in $(find $DIR -name '*.dotfile'); do
	filename=$(basename "$file")
	filename="${filename%.*}"
    echo "   $file  -->  ~/.$filename"
    cp $file ~/.$filename
    # cp $file dd/home/oviazlo/TEMP/rmMe/linuxConfigFiles/TEST/.$filename
done

# copy all environment files:
echo "Copying recursively following directories to ~:"
for iDir in ${DIRS[@]}; do
    echo "   $iDir"
    cp -r $iDir ~/
    # cp -r $iDir /home/oviazlo/TEMP/rmMe/linuxConfigFiles/TEST/
done
