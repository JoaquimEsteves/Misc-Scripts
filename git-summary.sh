#!/bin/bash
# Remember to set [color] diff/status = always in your git config :)
RED=$(printf '\033[0;31m')
GREEN=$(printf '\033[0;32m')
NC=$(printf '\033[0m') # No Color

status=$(git status -sb)
echo "$status" | head -n 1
for filter in A C D M R T U X B
    do git diff --staged --diff-filter="$filter" --stat | tac | tail -n +2 | tac | sed "s/.*/${GREEN}${filter}${NC} &/"
done
for filter in A C D M R T U X B
    do git diff --diff-filter="$filter" --stat | tac | tail -n +2 | tac | sed "s/.*/${RED}${filter}${NC} &/"
done
echo "$status" | grep "??"
