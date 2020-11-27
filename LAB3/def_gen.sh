#!/bin/bash
echo $$ > .pid
echo "" > deflab3.log

while true; do
	pid=$(ps -A| awk '{print $1}' | tail -n 10 | head -n 1)
	echo "$pid is working and soon going on vacation" >> deflab3.log
	sleep 3
done