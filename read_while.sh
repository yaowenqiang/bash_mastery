#!/bin/bash

while read line;do
  echo "$line"
done < "$1"

#while read line < "$1";do
#  echo "$line"
#done 


# process substitution
while read line ;do
  echo "$line"
done  < <(ls $HOME)
