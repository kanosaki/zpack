#!/bin/bash

if [[ ! -e ~/.tmux.conf ]]; then
  touch ~/.tmux.conf
fi

cat $BASE_DIR/tmux/statusline.tmux.conf >> ~/.tmux.conf
