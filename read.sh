#!/bin/bash

read name age town

echo "My anme is $name"
echo "I am $age"
echo "I am from $town"

read -t 5 -s -p "Input your first name: " name
echo "My anme is $name"

read -t 5 -s -p "Input your age: " age
echo "I am $age"

read -t 5 -s -p "Input your town: " town
echo "I am from $town"


