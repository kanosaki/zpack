#!/usr/bin/env zsh

mkdir -p $PACKDIR/vim/swap
mkdir -p $PACKDIR/vim/backup
mkdir -p $PACKDIR/vim/dein/repos/github.com/Shougo
rsync -a --exclude='.git' dein/repos/github.com/Shougo/dein.vim $PACKDIR/vim/dein/repos/github.com/Shougo
cp -r colors $PACKDIR/vim
cp -r ftplugin $PACKDIR/vim
cp -r plugin $PACKDIR/vim
cp vimrc $PACKDIR/vim
cp dein.toml $PACKDIR/vim
cp dein_lazy.toml $PACKDIR/vim
