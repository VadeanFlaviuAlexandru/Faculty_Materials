#!/bin/bash

#take as parameters a few directory names and it will display the names of all 
#binary files in the given directories and their subdirectories

clear
echo "_________________________________________________________"
echo " "
if [ "$#" -eq 0 ]
	then
		echo "You did not enter a directory. Please do so."
	else
		for i in $@
		do
			ls -R "$i"
		done
		echo "--------------------------------------"
		echo "->Done. Now we gonna show it through a graph."
		echo "--------------------------------------"
		for i in $@
		do
			tree "$i"
		done
fi
echo "_________________________________________________________"
