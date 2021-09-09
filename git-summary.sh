# Remember to set [color] diff/status = always in your git config :)
RED=$(printf '\033[0;31m')
NC=$(printf '\033[0m') # No Color

git status -sb | head -n 1
for filter in A C D M R T U X B; do git diff --diff-filter="$filter" --stat | tac | tail -n +2 | tac | sed "s/.*/${RED}${filter}${NC} &/"; done
git status --porcelain -s | grep "^?? " | sed 's/??/U/'
