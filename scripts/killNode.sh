#!/bin/bash
cat_lines=$(ps -L u n | grep node | sort -gu | tr -s " " | cut -d " " -f 2)
IFS='\n' read -r -a lines <<< "$cat_lines"
for node_pid in "${lines[@]}"; do
	echo "Killing $node_pid...\n"
	kill -9 $node_pid
done
