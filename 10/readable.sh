#!/bin/bash

checkFile() {
	if [ -f $1 ]; then 
		message="The file Exists and is "
	else echo "File does not exist"
	fi
	if [ -w $1 ]; then
		message=$message"Writable "
	fi
	if [ -r $1 ]; then
		message=$message"Readable "
	fi
	if [ -x $1 ]; then
		message=$message"Executable"
	fi
echo $message
}
checkFile $1
