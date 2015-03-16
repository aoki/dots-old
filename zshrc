set -o vi

setopt no_beep
setopt autocd
setopt autopushd
unsetopt correct_all

autoload -U compinit && compinit
autoload -U promptinit && promptinit

# This will set the default prompt to the walters theme
zstyle ':prompt:powerline:ps1' hide-user true
zstyle ':prompt:powerline:ps1' hide-host true
prompt powerline

REPORTTIME=3

# History
HISTFILE=$HOME/.zsh-history           # histories-file
HISTSIZE=1000                         # number of histories within session
SAVEHIST=10000                        # number of histories within HISTFILE
setopt extended_history               # 履歴ファイルに時刻を記録
#function history-all { history -E 1 } # 全履歴の一覧を出力する

setopt hist_ignore_all_dups
autoload -U peco_select_history && zle -N peco_select_history && bindkey '^r' peco_select_history

autoload -U idea
autoload -U h
autoload -U knife_solo_check && alias knife=knife_solo_check
compdef ssh-host-color=ssh && alias ssh='~/bin/ssh-host-color' 

[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc;source ~/.zshrc'
alias zshenv='vim ~/.zshenv;source ~/.zshenv'
alias rm='rmtrash'
alias b2d='boot2docker'
alias dl='docker ps -lq'
alias dstop='docker ps -q | xargs docker stop'
alias dkill='docker ps -q | xargs docker rm'
alias d='docker'
alias ls='ls -GhF'
alias ll='ls -ltrGhF'
