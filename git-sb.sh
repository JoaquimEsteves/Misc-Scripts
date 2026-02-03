#!/usr/bin/env bash

#  ________________________________
# /                                \
# | Use FZF to select branch!      |
# \__________________________  __'\
#                            |/   \\
#                             \    \\  .
#                                  |\\/|
#                                  / " '\
#                                  . .   .
#                                 /    ) |
#                                '  _.'  |
#                                '-'/    \
# 
# USAGE:
# git sb <optional name>

fzf-git-branch() {
    git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --query="$1" --height 50% --ansi --no-multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}

branch=$(fzf-git-branch "$1")

if [[ "$branch" = "" ]]; then
    echo "No branch selected."
    exit 1
fi

# If branch name starts with 'remotes/' then it is a remote branch. By
# using --track and a remote branch name, it is the same as:
# git checkout -b branchName --track origin/branchName
if [[ "$branch" = 'remotes/'* ]]; then
    git checkout --track "$branch"
else
    git switch "$branch"
fi




