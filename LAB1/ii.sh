#!/bin/bash
y=""
read x
y="$x"
while [[ "$x" != "q" ]]
do 
read x
y="$y$x"
done
echo "$y"
