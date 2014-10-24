#!/bin/sh

MY_DOTFILES=$HOME/dotfiles
TB_DOTFILES=$HOME/dotfiles-thoughtbot

if [ ! -e $TB_DOTFILES ]; then
  git clone https://github.com/thoughtbot/dotfiles.git $TB_DOTFILES
fi

rcup -d $TB_DOTFILES -x README.md -x LICENSE -x Brewfile -x rcrc
rcup -f -d $MY_DOTFILES -x README.md -x Brewfile -x install

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim -u ~/.vimrc.bundles +BundleInstall +qa
