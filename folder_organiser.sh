#!/bin/bash

# author jacky.yao
# Crated date: 2026
# Last modified:  2026-04-21

# Description: 
# Keeps a folder specified by the user clean by moving files into folders based on their file extensions

# usage: ./folder_organiser.sh 


read -p "Which folder do you want to organise?: " folder

while read filename; do
  case "$filename" in
    *.jpg|*.jpeg|*.png)
      subfolder="images" ;;
    *.doc|*.docs|*.txt|*.pdf)
      subfolder="documents" ;;
    *.xls|*.xlsx|*.csv)
      subfolder="spreedsheets" ;;
    *.sh)
      subfolder="scripts" ;;
    *.zip|*.tar|*.tar.gz|*.tar.gz.bz2)
      subfolder="archives" ;;
    *.ppt|*.pptx)
      subfolder="presentations" ;;
    *.mp3)
      subfolder="audio" ;;
    *.mp4)
      subfolder="video" ;;
    *)
      subfolder="." ;;
  esac

  if [ ! -d "$folder/subfolder" ];then
    mkdir "$folder/subfolder"
  fi

  mv "$filename" "$folder/subfolder"

done < <$(ls "$folder")

for file in "${files[@]}"; do:
  rm -i "$file"
done
