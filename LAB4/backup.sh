#!/bin/bash

now=$(date "+%F")
now_seconds=$(date -d $now +"%s")
backup_date=$(ls ~ | grep -o -E "^Backup-[0-9]{4}-[0-9]{4}-[0-9]{4} | cut -d "-" -f 2,3,4 | sort -n -r | head -n 1)
backup_seconds=$(date -d "$backup_date" +"%s")
day_before=$(echo "($now_seconds - $backup_seconds)/(60 * 60 * 24)" | bc -l)

lastDir="$HOME/Backup-$backup_date"
nowDir="$HOME/Backup-$now"
reportDir="$HOME/backup-report"
sourceDir="$HOME/source"

if (( $day_before > 7 )) || [[ -z $backup_date ]]
then
  mkdir $nowDir
  for file in $(ls $sourceDir)
  do
    cp $sourceDir/$file $nowDir
  done
  files=$(ls $sourceDir)
  echo -e "Backup created at $now in $nowDir:\n$files" >> $reportDir
else
  for file in $(ls $sourceDir)
  do
    if [[ -f $lastDir/$file ]]
    then
      sourceSize=$(stat $sourceDir/$file -c%s)
      bpSize=$(stat $lastDir/$file -c%s)
      if [[ $sourceSize -ne $bpSize ]]
      then
        mv $lastDir/$file $lasDir/$file.$now
        cp $sourceDir/$file $lastDir/$file
        echo "$now: $file was renamed to $file.now and copied to $lasDir" >> $reportDir
      fi
    else
      cp $sourceDir/$file $lastDir
      echo "$now: $file was copied to $lasDir" >> $reportDir
    fi
  done
fi