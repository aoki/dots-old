set -o vi

setopt no_beep
setopt autocd
setopt autopushd
unsetopt correct_all

autoload -U compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
prompt powerline

REPORTTIME=3

# History
HISTFILE=$HOME/.zsh-history           # histories-file
HISTSIZE=1000                         # number of histories within session
SAVEHIST=10000                        # number of histories within HISTFILE
setopt extended_history               # 履歴ファイルに時刻を記録
function history-all { history -E 1 } # 全履歴の一覧を出力する
