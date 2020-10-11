#!/bin/bash
echo "Menu:"
echo "Type 1 to open NANO"
echo "Type 2 to open VIM"
echo "Type 3 to open notepad fr windows"
echo "Type 4 to exit"
read a
case $a in
1 )
nano
;;
2 )
vi
;;
3 )
notepad.exe
;;
4 )
exit 0
;;
esac
