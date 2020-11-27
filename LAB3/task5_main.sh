#!/bin/bash

mkfifo task5_pipe

./task5_handler.sh &
./task5_gen.sh

rm task5_pipe