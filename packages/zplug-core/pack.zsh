#!/usr/bin/env zsh
#
export ZPACK_ZPLUG_LOCALDIR=${ZPACK_ZPLUG_LOCALDIR:-$HOME/.zplug}

cp zplug_loader.zsh $PACKDIR/zsh/autoload/

# install zpack in local machine
# and mirror contents to remote machine
__zpack::zplug::pack_mirror_mode() 
{
  if [[ ! -d $ZPACK_ZPLUG_LOCALDIR ]]; then
    echo "ERROR: Please install zpack at $ZPACK_ZPLUG_LOCALDIR(\$ZPACK_ZPLUG_LOCALDIR)"
    echo "ERROR: OR use \$ZPACK_ZPLUG_NOLOCAL mode."
    return -1
  fi
}

if [[ -z $ZPACK_ZPLUG_NOLOCAL ]]; then
  git_sync https://github.com/zplug/zplug.git $PACKDIR/zplug
else
  __zpack::zplug::pack_mirror_mode
fi

