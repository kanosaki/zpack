#!/bin/bash

ZSH_DIR=~/.zsh

rm -rf $ZSH_DIR
cp -R $BASE_DIR/zsh $ZSH_DIR 

ln -fs $ZSH_DIR/init.zsh ~/.zshrc
