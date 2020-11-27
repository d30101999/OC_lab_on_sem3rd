#!/bin/bash

SECONDS=0

for pid in $(ps -Ao pid | tail -n +2)
do
rc=$(grep -Ehsi "rchar" /proc/$pid/io | grep -o "[0-9]\+")
if [[ -n $rc ]]
then
echo $pid $rc
fi
done | sort --key=1 -V > t1

timer=-1

while [ $SECONDS -le 5 ]
do
if [[ $timer -eq $SECONDS ]]
then continue
fi 
echo $SECONDS "sec"
timer=$SECONDS
done

echo "" > t2

while read line
do
PID=$(echo $line | awk '{print $1}')
rcBefore=$(echo $line | awk '{print $2}')
rcAfter=$(grep -Ehsi "rchar" /proc/$PID/io | grep -o "[0-9]\+")
total=$(echo $rcAfter-$rcBefore | bc)
command=$(ps "$PID" | tail -n 1 | awk '{print $5}')
echo "$PID:$command:$total" >> t2
done < t1

sort -t ":" -nrk3 t2 | head -n 3
rm t1
rm t2


