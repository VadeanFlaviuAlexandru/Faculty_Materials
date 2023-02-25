#!/bin/bash

clear
#will take as parameters several file names, will display the number of files entered
#and also average number of words per file and total word count.
# (aevrage = word count / number of files )

echo "___________________________________________________________________"
echo " "
if [ $# -eq 0 ]
	then
		echo "You did not enter any files. Please do so."
	else
		echo "Let's see... you entered $# files. You can do better, but sure."
		echo " "
		NR_FILES=$#
		SUM=0
		for file in "$@"
		do	
			WORD_COUNT=$(wc -w <"$file")
			echo "  So, for this file, $file , you have $WORD_COUNT words in this file."
			echo "And the average number of words per file is... give me a second... is $((WORD_COUNT/NR_FILES))."
			SUM=$((SUM+WORD_COUNT))
			echo " "
		done
		echo "The number of words in total is: $SUM "
fi 
echo "___________________________________________________________________"
