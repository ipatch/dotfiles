#!/bin/bash

shopt -s extglob

while IFS=: read -r key value; do
  key="${key##+( )}"
  value="${value##+( )}"
  case "$key" in
    "Product ID")
        p="${value% *}"
        ;;
    "Vendor ID")
        v="${value%% *}"
        ;;
    "Manufacturer")
        m="${value}"
        ;;
    "Location ID")
        l="${value}"
        printf "%s:%s %s (%s)\\n" "$v" "$p" "$l" "$m"
        ;;
  esac
done < <( system_profiler SPUSBDataType )
