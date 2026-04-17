#!/bin/bash

if [[ $# -ne 2 ]]; then
  echo "You didn't enter excatly 2 paramegers"
  echo "Usage: $0 <fiel1> <file2>"
  exit 1
fi
