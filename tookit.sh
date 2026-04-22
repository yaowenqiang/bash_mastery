#!/bin/bash

# author jacky.yao
# Crated date: 2026
# Last modified:  2026-04-22

# Description: 
# Menu to select which utility should be run

# usage: ./toolkit.sh 

PS3="Which utility do you want to run?: "
select script in "cruft_remover" "folder_organiser"; do
  "$HOME/bash_course/scripts/$script.sh"
  bresk
done

