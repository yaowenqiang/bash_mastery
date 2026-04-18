#!/bin/bash

#touch $@
# touch "daily feedback" "monthly report"
#echo "$@"
#touch "$@"
IFS=,
echo "$*"

