#!/usr/bin/env zsh

rm -rf $PACKDIR/zsh
mkdir -p $PACKDIR/zsh
cp -r autoload $PACKDIR/zsh
cp -r fpath $PACKDIR/zsh
cp -r init.zsh $PACKDIR/zsh
cp -r install.sh $PACKDIR/zsh
