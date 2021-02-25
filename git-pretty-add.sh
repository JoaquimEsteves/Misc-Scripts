#!/bin/bash

# Pretty git add. Uses fzf :)
set -e

fzf-down() {
  fzf-tmux --height 50% "$@" --border
}

_gf() {
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
  --bind 'alt-j:preview-down,alt-k:preview-up' \
  --header 'Ctrl-j: Down, Ctrl-k: Up Alt-j:preview-down,Alt-k:preview-up' \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}


# See https://junegunn.kr/2016/07/fzf-git/
git add $(_gf)
