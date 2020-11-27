#!/bin/bash

curr_operation="+"
var=1

(tail -f task5_pipe) |
while true;
do
	read LINE

	#echo $LINE

	case "$LINE" in
		"+")
			curr_operation="$LINE"
			echo "Plus"
		;;
		"*")
			curr_operation="*"
			echo "Multi"
		;;
		[0-9]*)
			case $curr_operation in
				"+")
					result=$(($var + $LINE))
					echo "$result"
				;;
				"*")
					result=$(($var * $LINE))
					echo "$result"
				;;
			esac
		;;
		"QUIT")
			echo "quit"
			killall tail
			exit 0
		;;
		*)
			echo "Hanlder : Error."
			killall tail
			exit 1
		;;
	esac
done