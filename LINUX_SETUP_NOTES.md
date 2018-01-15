# Random Notes from Linux desktop install

* Install vim-gnome first
* Install tmux: https://launchpad.net/~hnakamur/+archive/ubuntu/tmux
* sudo apt-get install aptitude
* sudo aptitude install xserver-xorg-input-libinput

Add options to /usr/share/X11/xorg.conf.d/90-libinput.conf
```
  Option "NaturalScrolling" "on"
  Option "Tapping" "on"
  Option "DisableWhileTyping" "on"

```

* apt-get install slack
* snap install spotify - still not working properly, skipping songs
* apt-get install debian-goodies
* apt-get install rofi
* apt-get install compton
* Gnome terminal theme - https://github.com/dracula/gnome-terminal

# Sounds

* sudo apt-get install pulseaudio-utils

# Appearance
* sudo apt-get install lxapperance

# TODO
* Setup mouse for desktop at work
* Setup display layouts
* Setup ruby
* Setup screenshots
* Fix spotify skipping (and document it)