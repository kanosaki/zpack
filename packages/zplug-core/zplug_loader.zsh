source ~/.zplug/init.zsh

if [[ -f ~/.zsh/zplug.zsh ]]; then
  source ~/.zsh/zplug.zsh
else
  echo "WARNING: No zplug file found"
fi

# check コマンドで未インストール項目があるかどうか verbose にチェックし
# false のとき（つまり未インストール項目がある）y/N プロンプトで
# インストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# プラグインを読み込み、コマンドにパスを通す
zplug load --verbose
