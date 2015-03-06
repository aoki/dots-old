export LANG=ja_JP.UTF-8
export GOPATH=$HOME/.go
export GOROOT=/usr/local/opt/go/libexec
export DOCKER_HOST=tcp://192.168.59.103:2375

export GITHUB_CLIENT_ID="d1cd9c2238d27149bc85"
export GITHUB_CLIENT_SECRET="81397a3be3dd0b9250c6befc337846457"
export GITHUB_OAUTH_TOKEN="d2ff5c4ca635f635de4b2b44da242de9ee1b77bb"
export GITHUB_USERNAME="ringohub"
export BITLY_ACCESS_TOKEN="2b510026dcc8fdb3dc3c82ad668d672fbea5e0ed"
export TWITTER_ACCESS_TOKEN_KEY="2759760949-MiFMiZD63v3KKkntXQ07k0qN54RYA53WgyZkBUj"
export TWITTER_ACCESS_TOKEN_SECRET="wwiX7ZdO8Kb3szHogLOzGJdQQw1zvU3KGWwWa1ZkehMvd"
export TWITTER_CONSUMER_KEY="j26cjcjLPNwOlD0KMwS6kPYI4"
export TWITTER_CONSUMER_SECRET="jcYuHIfeKPHl2DZv73Lt55XE1je32Y8g3ultsfeCPFwONaVupL"

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
