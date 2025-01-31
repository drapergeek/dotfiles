#!/bin/bash

edit=lvim
tty=kitty

menu() {
  cat << EOF
1. aerospace
2. tmux
3. vim
EOF
}

main() {
  choice=$(menu | choose | cut -d. -f1)
  echo $choice
  
  case $choice in 
    1) file="~/.aerospace.toml" ;;
    2) file="~/.tmux.conf" ;;
    3) file="~/.config/lvim/config.lua" ;;
    *) return ;;
  esac

  echo $file

  $tty -e $edit "$file"
}

main
