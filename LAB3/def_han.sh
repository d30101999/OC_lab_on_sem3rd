#!/bin/bash
(tail -f deflab3.log) |
while true; do
	read LINE
	checkit=$(echo $LINE | grep -o [0-9]*)
	
	if [[ $checkit > 1000 ]]
	then
		kill 15 $(cat .pid)
		echo "WASTED $(cat .pid)" >> deflab3.log
		exit
	fi
	sleep 3
done
