
rm -rf $PACKDIR/zsh/prezto
mkdir -p $PACKDIR/zsh/prezto

cp -r modules $PACKDIR/zsh/prezto/modules
cp -r runcoms $PACKDIR/zsh/prezto/runcoms
cp init.zsh $PACKDIR/zsh/prezto/init.zsh

cp prezto_loader.zsh $PACKDIR/zsh/autoload/prezto_loader.zsh
