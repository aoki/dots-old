# for duplicate path
typeset -U path cdpath fpath manpath

path=( /usr/local/bin(N-/) $path)
fpath=(~/.zsh/functions(N-/) $fpath)

path=( /opt/chef/embedded/bin(N-/) $path)
path=( ~/.nodebrew/current/bin(N-/) $path)
path=( ~/.rbenv/shims ~/bin(N-/) $path)
fpath=( ~/.zsh/zsh-prompt-powerline(N-/) $fpath)

eval "$(rbenv init -)"

typeset -xT SUDO_PATH sudo_path
sudo_path=(~/bin(N-/) $path)
typeset -U sudo_path


