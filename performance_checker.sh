#!/bin/bash

date >> performance.log

ping -c 1 google.com &> /dev/null

if [ "$?" -eq 0 ]; then
  echo "Internet: Connected" >> performance.log
else
  echo "Internet: Disconected" >> performance.log
fi

echo "RAM Usage : " >> performance.log
free -h | grep "Mem" >> performance.log

echo "Swap Usage: " >> performance.log
free -h | grep "Swap" >> performance.log

echo "Disk Usage: " >> performance.log
df -h >> performance.log

echo ""



