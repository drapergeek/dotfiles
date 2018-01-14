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
