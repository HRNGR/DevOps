#!/bin/bash

INPUT="$1"
while IFS= read -r line; do
  [[ $line =~ ^[0-9]+ ]] && days=$(echo "${BASH_REMATCH[0]} / (1000 * 60 * 60 * 24)" | bc -l)
  [[ $days =~ '.'[0-9]+ ]] && hours=$(echo "${BASH_REMATCH[0]} * 24" | bc -l)
  [[ $hours =~ '.'[0-9]+ ]] && minutes=$(echo "${BASH_REMATCH[0]} * 60" | bc -l)
  [[ $minutes =~ '.'[0-9]+ ]] && seconds=$(echo "${BASH_REMATCH[0]} * 60" | bc -l)
  [[ $seconds =~ '.'[0-9]+ ]] && ms=$(echo "${BASH_REMATCH[0]} * 1000" | bc)
  [[ $line =~ 'mS'(.*) ]] && line="${BASH_REMATCH[1]}"
  printf "%d:%d:%d:%d:%d" "$days", "$hours", "$minutes", "$seconds", "$ms" 2>/dev/null
  printf "$line\n"
done < "$INPUT"