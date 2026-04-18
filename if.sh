#!/bin/bash

if [ 2 -gt 1 ]; then
  echo test passed
fi

if [ 2 -eq 1 ]; then
  echo test passed
else
  echo test failed
fi

if [ 2 -eq 1 ]; then
  echo test passed
elif [ 2 -eq 2 ]; then
  echo test successed
else
  echo test failed
fi
