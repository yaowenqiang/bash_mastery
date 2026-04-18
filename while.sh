#!/bin/bash

read -p "Enter you number: " number

while [ $number -gt 10 ]; do
   echo "$number"
   number=$(( $number -1 ))
done

