#!/bin/bash

readarray -t files < files.txt

for file in "${files[@]}";do
  if [ -f "$file" ]; then
    echo "$file already exists"
  else
    touch "$file"
    echo "$file was created"
  fi

  #touch "$file"
done
