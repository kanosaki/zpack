
if [[ `uname` != Linux ]]; then
  return
fi

alias ls=ls --color=auto -F
function chpwd() {
  ls --color=auto
}

[[ -n $commands[gvim] ]] && alias v=gvim

