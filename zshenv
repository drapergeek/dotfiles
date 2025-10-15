# use vim as the visual editor
export VISUAL=lvim
export EDITOR=$VISUAL

# ensure dotfiles bin directory is loaded first
export PATH="$HOME/.bin:/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
source "/Users/jasondraper/.rover/env"
