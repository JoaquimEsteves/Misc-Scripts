#!/bin/bash
set -e

if [[ "$XDG_SESSION_TYPE" == 'wayland' ]]; then
  # wayland is super ass and I hate it
  # gnome-screenshot -f /tmp/blurred/screenshot.png
  # convert /tmp/blurred/screenshot.png -blur 0x5 /tmp/blurred/screenshotblur.png
  # rm /tmp/blurred/screenshot.png
  gnome-screensaver-command --lock
else

  scrot /tmp/screenshot.png
  convert /tmp/screenshot.png -blur 0x5 /tmp/screenshotblur.png
  i3lock -e -i /tmp/screenshotblur.png
  # i3lock-fancy
fi
