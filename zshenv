export LANG=ja_JP.UTF-8
export GOPATH=$HOME/.go
export GOROOT=/usr/local/opt/go/libexec

export DOCKER_HOST=tcp://192.168.59.103:2375
export DOCKER_CERT_PATH=/Users/ringo/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.7"`

# for duplicate path
typeset -U path cdpath fpath manpath sudo_path


fpath=(
  ~/.zsh/functions(N-/)
  ~/.zsh/functions/*(N-/)
  $fpath)

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

