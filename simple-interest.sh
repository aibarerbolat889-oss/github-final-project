#!/usr/bin/env bash
# Calculate simple interest using P * R * T / 100.
set -euo pipefail
printf '%s\n' 'Simple Interest Calculator'
read -r -p 'Enter principal amount: ' principal
read -r -p 'Enter annual rate of interest (%): ' rate
read -r -p 'Enter time period in years: ' years
number='^[0-9]+([.][0-9]+)?$'
if ! [[ "$principal" =~ $number && "$rate" =~ $number && "$years" =~ $number ]]; then
  printf '%s\n' 'Error: all inputs must be non-negative numbers (use a dot for decimals).' >&2
  exit 1
fi
awk -v p="$principal" -v r="$rate" -v t="$years" 'BEGIN {printf "Simple Interest: %.2f\n", p*r*t/100}'
