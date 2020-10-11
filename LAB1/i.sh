#!/bin/bash
if [[ $# != 3 ]]
then 
	echo "use only 3 values"
	exit
fi
test=0
if [[ $1 -ge  $2 ]]
then test=$1
else test=$2
fi
if [[ $test -le  $3 ]]
then test=$3
fi
echo $test
