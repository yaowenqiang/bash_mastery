#!/bin/bash

# readarray is not available in zsh, use compatibility check
if [[ -n "$ZSH_VERSION" ]]; then
    # zsh compatible approach
    files=("${(@f)$(<files.txt)}")
elif declare -f readarray >/dev/null 2>&1; then
    # bash with readarray support
    readarray -t files < files.txt
else
    # fallback to older bash/sh approach
    files=()
    while IFS= read -r line; do
        files+=("$line")
    done < files.txt
fi

for file in "${files[@]}"; do
  if [ -f "$file" ]; then
    echo "$file already exists"
  else
    touch "$file"
    echo "$file was created"
  fi
done
