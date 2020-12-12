#!/bin/bash
trashdir=$HOME/trash
trashlog=$HOME/trash.log
restore(){
path=$1
filename=$2
ln "$trashdir/$filename" $path
}

if [[ $# -ne 1 ]]
then 
echo "Invalid argument"
fi

file=$1
line=""
grep -s $file $trashlog |
while read line; do
file_to_restore=$(echo $line | awk '{print $1}')
file_in_trash=$(echo $line | awk '{print $2}')
echo $file_in_trash
echo "Would you like restore $file_to_restore ?"
echo "Enter answer yes(y) or no(n)"
read answer</dev/tty
if [[ $answer == "y" ]]; then
tempDirectory=$(dirname $file_to_restore)
if [[ -d $tempDirectory ]]; then
$(restore "$file_to_restore" "file_in_trash")
else
$(restore "$HOME/$file" "file_in_trash")
echo "Directory $tempDirectory not exitsts anymore, restoring at $HOME"
fi

rm -f $trashdir/$file_in_trash && {
sed -i "#$line#" $trashlog
echo "Restore $file_to_restore"
}
fi
done