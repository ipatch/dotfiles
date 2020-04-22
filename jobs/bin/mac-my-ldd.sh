#!/usr/bin/env bash 

while getopts "r" OPTION; do
  case $OPTION in   
    r) export DYLD_PRINT_RPATHS=1;;
  esac
done
shift $((OPTIND-1))

cp `which true` .
DYLD_PRINT_LIBRARIES=1 \
DYLD_PRINT_LIBRARIES_POST_LAUNCH=1 \
DYLD_INSERT_LIBRARIES=$1 \
./true
rm ./true