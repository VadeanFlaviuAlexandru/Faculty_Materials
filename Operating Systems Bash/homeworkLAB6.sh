#!/bin/bash

#users given as parameters and if it disconnects or connects from the system, it will
#save the username, time, if its a new connection or disconnection and the server
#on which the action was made

function SaveInfo
{	
	echo "( Last information saved about "$user" )"					 >> LAB6_Log
	echo "The server		Time and Date" 			 		 >> LAB6_Log
	echo " " 							 		 >> LAB6_Log
	last | grep $user | awk '{print $3"		"$4" "$5" "$6" "$7" "$8" "$9}'   >> LAB6_Log
	echo "____________________"							 >> LAB6_Log
	echo " " 		 						         >> LAB6_Log
}

function CheckUser
{
	for user in $( who | awk '{print $1}' | uniq )
	do  
		if [ $user == "$1" ]
		then
			return 0
		fi
	done
	return 1
}

clear
echo "+____________________________________________________________+"
echo " "
if [ $# -eq 0 ]
	then
		echo "You did not enter a username. Please enter one... or more, I guess."
	else
		echo "The information about the following users are saved in the file: LAB6_Log "
		for i in $@
		do
			n=0
			m=0
			echo "Supervising this user: "$i" "
			
			while [ $n -le 4 ]
			do
				user=$i
				CheckUser $user
				TheAnswer=$?

				if [ $TheAnswer == 0 ]
				then 
					n=$((n+1))
					echo "checking again for "$i"..."
					sleep 2
				else
					m=$((m+1))
					echo "checking again for "$i"..."
					sleep 2
				fi
				
				if [ $m == 4 ] && [ $n == 0 ]
				then
					echo "User not found. Probably not existing"
					break
				fi
				if [ $n == 4 ]
				then
					echo "Saving information..."
					echo "____________________NEW CONNECTION" >> LAB6_Log
					SaveInfo $user
					echo "Information saved!"
					break
				fi
				if [ $m == 4 ] && [ $n != 0 ]
				then
					echo "Something happened. User maybe disconnected..."
					echo "____________________NEW DISCONNECTION" >> LAB6_Log
					SaveInfo $user
					echo "Saved last information possible."
					break
				fi
			done		
		done
		echo "Exiting..."
				
fi
echo " "
echo "+____________________________________________________________+"	

