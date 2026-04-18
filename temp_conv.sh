#!/bin/bash

while getopts "f:c:" opt;do
  case "$opt" in
    c) result=$(echo "scale=2; ($OPTARG * (9/5)) + 32" | bc)
    ;;
    f) result=$(echo "scale=2; ($OPTARG -32) * (5 / 9)" | bc)
    ;;
    \?) 
    ;;
  esac
  
done


echo "$result"
#cal -A

# ./temp_conv.sh -f 32
# ./temp_conv.sh -c 0
