set -o vi
export LANG=ja_JP.UTF-8

setopt no_beep
setopt autocd
setopt autopushd

autoload -U compinit promptinit
compinit
promptinit

# History
HISTFILE=$HOME/.zsh-history           # histories-file
HISTSIZE=1000                         # number of histories within session
SAVEHIST=10000                        # number of histories within HISTFILE
#setopt extended_history               # 履歴ファイルに時刻を記録
#function history-all { history -E 1 } # 全履歴の一覧を出力する

# This will set the default prompt to the walters theme
prompt walters

alias zshrc='vim ~/.zshrc;source .zshrc'
alias zshenv='vim ~/.zshenv;source .zshenv'
