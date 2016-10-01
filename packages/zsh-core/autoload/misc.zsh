bindkey -e

# ヒストリの設定
HISTSIZE=1000000
SAVEHIST=1000000

# 履歴ファイルに時刻を記録
setopt extended_history

# 補完するかの質問は画面を超える時にのみに行う｡
LISTMAX=0

#autoload -Uz compinit; compinit

# Prediction
#autoload -U predict-on
#zle -N predict-on

autoload -U zmv
setopt AUTO_LIST
setopt AUTO_MENU

# sudo でも補完の対象
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
