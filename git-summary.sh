#!/bin/bash
# Remember to set [color] diff/status = always in your git config :)
RED=$(printf '\033[0;31m')
GREEN=$(printf '\033[0;32m')
NC=$(printf '\033[0m') # No Color

status=$(git status -sb)

function listAll() {
  for filter in A C D M R T U X B; do
    git diff $(test "$1" == "staged" && echo "--staged" || echo '') --diff-filter="$filter" --stat \
      | tac \
      | tail -n +2 \
      | tac \
      | sed "s/.*/$(test "$1" == "staged" && echo "$GREEN" || echo "$RED")${filter}${NC} &/"
  done
}

# see: https://github.com/LuRsT/hr
hr -
echo "$status" | head -n 1 | sed "s/##//g" | sed "s/\.\.\./ 💽 ... 🌐 /g"
echo "$GREEN$(git diff --shortstat --staged)"
echo "$RED$(git diff --shortstat)"
listAll staged
listAll
echo "$status" | grep "??"
hr -
