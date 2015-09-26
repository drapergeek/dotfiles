#!/bin/sh

MY_DOTFILES=$HOME/dotfiles

rcup -d $MY_DOTFILES -x README.md -x Brewfile -x install -x rcrc -x License
