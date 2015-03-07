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
function history-all { history -E 1 } # 全履歴の一覧を出力する

export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.7"`

setopt hist_ignore_all_dups
function peco_select_history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(fc -l -n 1 | eval $tac | sort |uniq | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco_select_history
bindkey '^r' peco_select_history

idea () {
  open -a /Applications/IntelliJ\ IDEA\ 14.app ${1}
}

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/ringo/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
