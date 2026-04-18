#!/bin/bash
IFS='.'
name="Simon.Smith"
out="output.txt"
#echo "$name" > ~/out txt
#echo "$name" > "~/$out"
#echo $name > ~/"$out"
echo $name >"$HOME/$out"
