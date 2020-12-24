#!/bin/bash
echo "" > fi_five1.txt
echo "" > process_membash1.txt
echo "Time" > mem1.txt
echo "Time" > swap1.txt
while true; do
	proccess_exist=$(top -b -n 1 | grep "mem.bash")
	st=$(echo "$process_exist" | awk '{print $8}')
	if [[ -z proccess_exist || "$st" != "R" ]]; then 
		exit 0
	fi
	mem_and_swap=$(top -b -n1 | head -n5 | tail -n2)
	mem=$(echo "$mem_and_swap" | head -n1)
	swap=$(echo "$mem_and_swap" | tail -n1)
	first_five=$(top -b -n 1 | head -n12 | tail -n5)
	echo -e "\n" >> first_five1.txt
	echo "$fi_five" >> fi_five1.txt
	process_exist=$(top -b -n 1 | grep "mem.bash")
	ctime=$(echo "$process_exist" | awk '{print $11}')
	echo "$ctime $process_exist" >> process_membash1.txt
	echo "$ctime $mem" >> mem1.txt
	echo "$ctime $swap" >> swap1.txt
	sleep 1
done