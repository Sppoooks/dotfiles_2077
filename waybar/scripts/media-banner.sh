#!/bin/bash

# things to improve
# find a way to make text loop around instead of reseing to beginning
# update the currently playing media while the inner while loop is running
# cannot handle titles with ampersand

threshold=20
character_gap="  "

while true;
do

	# 2>&1 redirects stderr to stdout
	string="$(playerctl metadata title 2>&1)"

	if [ ${#string} -gt ${threshold} ];
	then
		# I need to somehow make the text wrap around
		# text should not move for maybe 2 seconds when starting
		# maybe I should create an array [ 1 2 3 ... n {gap} ]
		# caan't find a way to make text wrap around so made the whole script
		# restart after scrolling reaches the end of the string
		# readarray -t char_array < <(echo "$string" | grep -o .)

		string="${string}${character_gap}"
		n=0

		while [[ $n -lt $(( ${#string}-$threshold )) ]];
		do
			if [[ $n -eq 0 ]];
			then
				echo "$(playerctl status): ${string:$n:${threshold}}"
				sleep 2s
				n=$((n+1))
			fi

			echo "$(playerctl status): ${string:$((n)):${threshold}}"
			sleep 0.25s

			n=$((n+1))
		done
	elif [ "${string}" = "No players found" ];
	then
		echo "Nothing playing"
	elif [ ${#string} -lt ${threshold} ];
	then
		echo "$(playerctl status): ${string}"
	fi
	sleep 1s
done
