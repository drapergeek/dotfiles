#!/bin/sh

MY_DOTFILES=$HOME/dotfiles

rcup -d $MY_DOTFILES \
  -x README.md \
  -x Brewfile \
  -x install \
  -x rcrc \
  -x 90-libinput.conf

[ ! -d ~/.tmux/plugins/tpm ] && mkdir -p ~/.tmux/plugins && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 

brew bundle
