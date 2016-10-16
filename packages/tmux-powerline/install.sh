#!/bin/bash

if [[ ! -e ~/.tmux.conf ]]; then
  touch ~/.tmux.conf
fi

cat $BASE_DIR/tmux/statusline.tmux.conf >> ~/.tmux.conf
cp -r $BASE_DIR/tmux/powerline ~/.tmux/powerline
cp $BASE_DIR/tmux/tmux-powerlinerc ~/.tmux
if [[ -e ~/.tmux-powerlinerc ]]; then
  rm -f ~/.tmux-powerlinerc
fi
ln -s  ~/.tmux/tmux-powerlinerc ~/.tmux-powerlinerc
