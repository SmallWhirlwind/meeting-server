#! /bin/bash
# process-monitor.sh
process=$1
pid=netstat -anp|grep 8080|awk '{printf $7}'|cut -d/ -f1
echo $pid
kill -9 $pid