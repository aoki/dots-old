#!/bin/sh

cd ~

ln -s .dots/gitconfig .gitconfig
ln -s .dots/gitignore.default .gitignore.default

ln -s .dots/zsh .zsh
ln -s .dots/zshrc .zshrc
ln -s ~/dots/zshrc ~/.zshrc
ln -s .dots/zshenv .zshenv

ln -s `(brew --prefix)`/Library/Contributions/brew_zsh_completion.zsh .zsh/functions/_brew

ln -s .dots/vimrc .vimrc
ln -s ~/dots/vimrc ~/.vimrc
ln -s .dots/bashrc .bashrc

ln -s .dots/gemrc .gemrc
ln -s ~/dots/Brewfile /usr/local/Library/Brewfile

mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
~/.vim/bundle/neobundle.vim/neoinstall
