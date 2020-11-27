#!/bin/bash

proces=$(ps -U root --format pid,command | awk '{print $1" : "$2}')
cnt_proces=$(echo "$proces" | wc -l)
let "cnt_proces=cnt_proces-1"

echo "Processes started count is $cnt_processes" > lab2_1.txt
echo "$processes" >> 2_1.txt