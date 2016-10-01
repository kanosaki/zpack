#!/bin/bash
vimdir=~/.vim
rm -rf $vimdir/dein
rm -rf $vimdir/colors
rm -rf $vimdir/ftplugin
rm -rf $vimdir/plugin
rm -f $vimdir/vimrc
rm -f $vimdir/dein.vim
rm -f $vimdir/dein_lazy.vim


unlink ~/.vimrc
mkdir -p $vimdir/swap
mkdir -p $vimdir/backup
cp -r $BASE_DIR/vim/dein $vimdir/dein
cp -r $BASE_DIR/vim/colors $vimdir/colors
cp -r $BASE_DIR/vim/ftplugin $vimdir/ftplugin
cp -r $BASE_DIR/vim/plugin $vimdir/plugin
cp $BASE_DIR/vim/vimrc $vimdir
cp $BASE_DIR/vim/dein.toml $vimdir
cp $BASE_DIR/vim/dein_lazy.toml $vimdir

ln -s $vimdir/vimrc ~/.vimrc

