#!/bin/bash

# Pretty git add. Uses fzf :)
set -e

source ~/.bash_functions --source-only

# See https://junegunn.kr/2016/07/fzf-git/
git add $(_gf)
