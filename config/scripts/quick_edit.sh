#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Rofi menu for Quick Edit/View of Settings (SUPER E)

# Define preferred text editor and terminal
edit=nvim
tty=kitty
export NVIM_APPNAME=lazyvim

# Paths to configuration directories
swayConfig="$HOME/.config/sway/config"
swayConfigDir="$HOME/.config/sway/config.d/"
waybarConfig="$HOME/.config/waybar/config"

# Function to display the menu options
menu() {
  cat <<EOF
1. Edit SwayConfig
2. Edit idle
3. Edit Waybar
4. Edit Screenshot-Keybinds
EOF
}

# Main function to handle menu selection
main() {
  choice=$(menu | rofi -i -dmenu -config ~/.config/rofi/config-compact.rasi | cut -d. -f1)

  # Map choices to corresponding files
  case $choice in
  1) file="$swayConfig" ;;
  2) file="$swayConfigDir/90-swayidle.conf" ;;
  3) file="$waybarConfig" ;;
  4) file="$swayConfigDir/60-bindings-screenshot.conf" ;;
  *) return ;; # Do nothing for invalid choices
  esac

  # Open the selected file in the terminal with the text editor
  $tty -e $edit "$file"
}

main
