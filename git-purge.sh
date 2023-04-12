#!/bin/bash

# Remove all branches that have been merged
# From the local
# Will warn you if your branches are
# unmerged, and you need to add a -D
# If so, just invoke `git purge -D`

set -e

git fetch

branches_to_remove=$(git for-each-ref --format='%(refname:short)' refs/heads)

branches_to_remove=$(echo $branches_to_remove | tr ' ' '\n' | command grep -v "master\|main\|develop\|staging")

git branch -d $branches_to_remove
