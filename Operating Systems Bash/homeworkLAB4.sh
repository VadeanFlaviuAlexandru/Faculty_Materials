#!/bin/bash

#will take as parameter a word and several file names
#the shell will delete the lines containing the given word in all given files.

clear
echo "_______________________________________________________________"
echo " "
if [ $# -le 1 ]
	then
		echo "You did not enter a word or a file. Please enter both a word and a file."
	else
		echo "So, these are the files you entered:"

		for i in "${@:2}"
		do 
			echo "	File name: $i"
		done
		echo "I'm going to remove the first word you entered. (Which is $1)"

	for file in "${@:2}"
	do
		sed -i "/$1/d" "$file"
	done
	echo ".... and done."
fi
echo "________________________________________________________________"
