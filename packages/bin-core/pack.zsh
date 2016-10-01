if [[ ! $commands[go] ]]; then
  echo "WARNING: Go is not installed"
  return
fi

mkdir -p $PACKDIR/bin

__zpack::go_build() {
  if [[ $ZPACK_FAST && -e $1 ]]; then 
    return
  fi
  go get -u $2
  go build -i -o $1 $2
}

__zpack::go_build $PACKDIR/bin/fzf 'github.com/junegunn/fzf/src/fzf'

__zpack::go_build $PACKDIR/bin/pt 'github.com/monochromegane/the_platinum_searcher/cmd/pt'
