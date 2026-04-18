#!/bin/bash

read -p "Please enter a number: " number

case "$number" in
[0-9]) echo 'you have entered a single digit number' ;;
[0-9][0-9]) echo 'you have entered two digit numbers' ;;
[0-9][0-9][0-9]) echo 'you have entered three digit numbers' ;;
*) echo "you have enter a number that is more then three digits" ;;
esac
