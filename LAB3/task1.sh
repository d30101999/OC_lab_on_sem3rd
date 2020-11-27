#!/bin/bash

(mkdir ~/LAB3/test 2> /dev/null) && (echo $"Catalog test was created successefully" > ~/report.log) && touch ~/test/"$(date +"%d.%m.%y_%H:%M:%S_Launch_Script")"


(ping -w 1 "www.net_nikogo.ru" 2> /dev/null) || echo $(date +"%d.%m.%y_%H:%M:%S") site dose not work>> ~/report.log