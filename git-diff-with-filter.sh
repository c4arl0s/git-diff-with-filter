#!/bin/bash

PARAMETER=$1
let counter=0
git-status-with-filter ${PARAMETER} | tail -n +2 |  sed '$d' | while read modified_file; do
  echo "================="
  let "counter+=1"
  echo "${counter} - ${modified_file} 🟢"
  echo "================="
  
 file=$(echo "${modified_file}")
 git --no-pager diff --color=always "${file}" | less -R
done
