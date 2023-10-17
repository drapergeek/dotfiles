#!/bin/sh

MY_DOTFILES=$HOME/dotfiles

rcup -d $MY_DOTFILES \
	-x README.md  \
	-x Brewfile \
	-x install \
	-x rcrc \
	-x 90-libinput.conf
brew bundle

# sudo ln -s /home/draper/dotfiles/90-libinput.conf /usr/share/X11/xorg.conf.d/90-libinput.conf
