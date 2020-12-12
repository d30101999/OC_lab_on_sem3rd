#!/bin/bash

lastBackup=$(find ~/Backup-* -maxdepth 0 | sort -n | tail -n 1)

if [[ ! -d $HOME/restore ]]
then
mkdir $HOME/restore
fi

for file in $(ls $lastBackup | grep -E -v "[0-9]{4}-[0-9]{2}-[0-9]{2}")
do
cp $lastBackup/$file $HOME/restore
done