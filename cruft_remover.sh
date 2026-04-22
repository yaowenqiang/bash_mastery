#!/bin/bash

# author jacky.yao
# Crated date: 2026
# Last modified:  2026-04-21

# Description: 
# promptes you to remove all files in a specified folder that have not 
# been mofified within a given number of days

# usage: ./cruft_remover


read -p "Which filder do you want to remove unmodified files from?: " folder
read -p "How many days is too old?" days

readarray -t files < < $(find $folder --maxdepth 1 -type f -mtime "+$days")

for file in "${files[@]}"; do:
  rm -i "$file"
done
