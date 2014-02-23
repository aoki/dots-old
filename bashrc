export PATH="${PATH}:${HOME}/bin"
export LANG=ja_JP.UTF-8
set -o vi
set bell-style none

# for homebrew
if type brew >/dev/null 2>&1; then
  BREW_PREFIX=$(brew --prefix)
  if [ -e $BREW_PREFIX/Library/Contributions/brew_bash_completion.sh ]; then
    source $BREW_PREFIX/Library/Contributions/brew_bash_completion.sh >/dev/null 2>&1
  fi
fi
