export LANG=ja_JP.UTF-8
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export DOCKER_HOST=tcp://localhost:4243

# for duplicate path
typeset -U path cdpath fpath manpath sudo_path


fpath=(~/.zsh/functions(N-/) $fpath)
fpath=( ~/.zsh/zsh-prompt-powerline(N-/) $fpath)

path=(
  /usr/local/bin(N-/)
  /opt/chef/embedded/bin(N-/)
  ~/.nodebrew/current/bin(N-/)
  ~/.rbenv/shims ~/bin(N-/)
  ${GOPATH}/bin(N-/) ${GOROOT}/bin(N-/)
  $path)

eval "$(rbenv init -)"

typeset -xT SUDO_PATH sudo_path
sudo_path=(~/bin(N-/) $path)
typeset -U sudo_path

alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc;source ~/.zshrc'
alias zshenv='vim ~/.zshenv;source ~/.zshenv'
alias rm='rmtrash'
alias b2d='boot2docker'
alias dl='docker ps -lq'
alias dstop='docker ps -q | xargs docker stop'
alias dkill='docker ps -q | xargs docker rm'
alias d='docker'

function knife_solo_check() {
  if [ "$1" = 'solo' ] && [ "$2" = 'cook' ] && [ ! -d .chef ]; then
    \echo -e '\033[0;31mERROR:\033[0;39m Not chef repositry directory.'
  else
    \knife $@
  fi
}
alias knife=knife_solo_check
