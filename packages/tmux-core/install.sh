
rm -rf ~/.tmux
mkdir -p ~/.tmux
cp $BASE_DIR/tmux/tmux.conf ~/.tmux
cp $BASE_DIR/tmux/tmux-git-branch.sh ~/.tmux
cp $BASE_DIR/tmux/loadaverage.sh ~/.tmux
chmod +x ~/.tmux/tmux-git-branch.sh
chmod +x ~/.tmux/loadaverage.sh
unlink ~/.tmux.conf
ln -s ~/.tmux/tmux.conf ~/.tmux.conf
