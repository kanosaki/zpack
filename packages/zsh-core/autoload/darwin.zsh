
if [[ `uname` != Darwin ]]; then
  return
fi

function chpwd() {
  ls -G
}

alias o=open
alias ls=ls -FG

[[ $commands[mvim] ]] && alias v=mvim
