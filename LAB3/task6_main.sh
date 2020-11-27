  
#!/bin/bash

./task6_handler.sh &
pid=$!

./task6_gen.sh $pid