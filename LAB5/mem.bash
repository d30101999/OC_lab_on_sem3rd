#!/bin/bash
echo "" > report.log
counter=0
array=()
while true; do
	array+=( 1 2 3 4 5 6 7 8 9 10 )
	let counter=counter+2
	if [[ $(($counter % 1000000)) -eq 0 ]]
	then
		echo "${#array[@]}" >> report.log
	fi
done