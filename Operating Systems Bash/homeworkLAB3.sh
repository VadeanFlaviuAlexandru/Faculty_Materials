#!/bin/bash

#exercitiu 13
#take as parameter a username. The script will display the full name
#and if she/he is currently online

echo "Hello! Please insert username."
read username
if [ $username ]
	then
	echo "______________________________________"
	echo "So... the username is $username, huh?"
	echo "That means you are... " 
	getent passwd "$username" | cut -d ':' -f 5
	echo "... Are you online ?"
	echo "Let's check if you're connected"
	who -m
	echo "You are. Awesome!"
	echo "______________________________________"
fi
exit
