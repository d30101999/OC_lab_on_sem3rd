#!/bin/bash

TRASHDIR=$HOME/tash
TRASHLOG=$HOME/trash.log

file=$1
if [[ $# -ne 1 ]]
then 
echo "Invalid argument"
exit 1
fi

if [[ ! -f $file ]]
then
echo "Invalid file"
exit 1
fi

if [[ ! -d $TRASHDIR ]]; then
mkdir $TRASHDIR
touch $TRASHLOG
fi 

counter=0
trashFile="$file-$counter"
while [[ -e "$TRASHDIR/$trashFile" ]]; do
((counter=counter+1))
done

ln $file $TRASHDIR/$trashFile
rm -f $file && echo "$PWD/$file $trashFile" >> $TRASHLOG