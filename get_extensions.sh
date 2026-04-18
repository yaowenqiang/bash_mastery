#!/bin/bash

read -p "What is your first name?: " firstname
read -p "What is your last name?: " lastname

# Check if -N option is available (GNU bash feature)
if echo | read -N 1 test 2>/dev/null; then
    read -N 4 -p "What is your current extension number?(must be 4 digits): " ext
    echo
    read -N 4 -s -p "What access code would you like to use?(must be 4 digits): " access
    echo
else
    # Fallback to -n option for BSD/macOS compatibility
    read -n 4 -p "What is your current extension number?(must be 4 digits): " ext
    echo
    read -n 4 -s -p "What access code would you like to use?(must be 4 digits): " access
    echo
fi
echo "$firstname,$lastname,$ext,$access" >> extensions.csv

