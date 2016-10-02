
rm -rf $PACKDIR/zsh/enhancd
mkdir -p $PACKDIR/zsh/enhancd

cp -r custom $PACKDIR/zsh/enhancd/custom
cp -r src $PACKDIR/zsh/enhancd/src
mkdir -p $PACKDIR/zsh/enhancd/doc
cp -r doc/man $PACKDIR/zsh/enhancd/doc/man

cp custom.json $PACKDIR/zsh/enhancd/custom.json
cp init.sh $PACKDIR/zsh/enhancd/init.sh

cp enhancd_loader.zsh $PACKDIR/zsh/autoload/enhancd_loader.zsh
