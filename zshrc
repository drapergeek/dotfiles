eval "$(/opt/homebrew/bin/rtx activate zsh)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ -f ~/.zsh/prompt ]] && source ~/.zsh/prompt

# load our own completion functions
fpath=(~/.zsh/completion /usr/local/share/zsh/site-functions $fpath)

# load docker
#eval "$(docker-machine env default)"

# completion
autoload -U compinit
compinit

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# history settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.aliases_ezcater ]] && source ~/.aliases_ezcater

#secrets
[[ -f ~/.zsh_secrets ]] && source ~/.zsh_secrets

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;
        "$_dir"/post/*)
          :
          ;;
        *)
          if [ -f $config ]; then
            . $config
          fi
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

# automatically enter directories without cd
setopt auto_cd
cdpath=($HOME/code, $HOME/code/ezcater, $HOME/code/three-pair, $HOME/code/work)

# use vim as the visual editor
export VISUAL=nvim
export EDITOR=$VISUAL

# fix backspace and add shift-tab
bindkey '^[[Z' reverse-menu-complete       # Shift-Tab
bindkey -M viins '^?' backward-delete-char # Backspace

# prompt
# export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

unsetopt correct

# Appends every command to the history file once it is executed
setopt inc_append_history

# Reloads the history whenever you use it
setopt share_history

#show contents of directory after cd-ing into it
chpwd() {
    ls -l --git
}

#tab complete delete branch
_git-delete-branch() { _git-checkout }

export PATH="$HOME/.bin:$PATH"

export PATH="$PATH:/usr/local/lib/node_modules"

export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

export PATH="$PATH:/home/draper/.asdf/installs/nodejs/9.2.0/.npm/lib/node_modules/phantomjs-prebuilt/lib/phantom/bin"

export DISABLE_SPRING=1

export PROJECTS="$HOME/code/ezcater"

# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit

export PATH="binstubs:$PATH"

export ERL_AFLAGS="-kernel shell_history enabled"
eval "$(direnv hook zsh)"

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Setup Asdfp and completions
# . $HOME/.asdf/asdf.sh
# append completions to fpath
# fpath=(${ASDF_DIR}/completions $fpath)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jasondraper/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jasondraper/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jasondraper/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jasondraper/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
