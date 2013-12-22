# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

for function in ~/.zsh/functions/*; do
  source $function
done

# automatically enter directories without cd
setopt auto_cd

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

# look for ey config in project dirs
export EYRC=./.eyrc

#configure grep

# automatically pushd
setopt auto_pushd
export dirstacksize=5

unsetopt correct

# Enable extended globbing
setopt EXTENDED_GLOB

# story history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
REPORTTIME=10 # print elapsed time when more than 10 seconds

# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history

#show contents of directory after cd-ing into it
chpwd() {
    ls -lrthG
}
