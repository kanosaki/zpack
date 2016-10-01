#!/usr/bin/env zsh


# Lack of LANG(LC_ALL) configuration will cause broken completion on Linux(Arch 2016/9/26) 
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

ZSH_DIR=$HOME/.zsh

fpath=($ZSH_DIR/fpath $fpath)
path=(/usr/local/bin $path)

# Load plugins
for plugin in $ZSH_DIR/autoload/*.zsh; do
  source $plugin
done

autoload -U promptinit; promptinit
prompt pure

