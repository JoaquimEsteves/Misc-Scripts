echo "# $(git branch --show-current)"
for filter in A C D M R T U X B; do git diff --diff-filter="$filter" --stat | tac | tail -n +2 | tac | sed "s/.*/$filter &/"; done
git status --porcelain -s | grep "^?? " | sed 's/??/U/'
