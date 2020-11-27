//The first script in an endless cycle gets a list of processes and writes the first PID (or any PID) in a log file. A log format: “PID is working and soon going on vacation.” A second script once in 3 seconds checks the log file. If there is a PID > 1000, sends a signal to the first script, kills it, and writes in the log file “Wasted.”
#!/bin/bash
echo $$ > .pid
echo "" > deflab3.log

while true; do
	pid=$(ps -A| awk '{print $1}' | tail -n 10 | head -n 1)
	echo "$pid is working and soon going on vacation" >> deflab3.log
	sleep 3
done
