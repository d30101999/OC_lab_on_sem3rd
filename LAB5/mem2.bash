#!/bin/bash
echo "" > report2.log
array=()
counter=0
while true; do
	array+=( 1 2 3 4 5 6 7 8 9 10 )
	let counter=counter+2
	if [[ $(($counter % 1000000)) -eq 0 ]]
	then
		echo "${#array[@]}" >> report2.log
	fi
done