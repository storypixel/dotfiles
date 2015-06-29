# Source Antigen
source ~/dotfiles/antigen/antigen.zsh

# Antigen Bundles - oh-my-zsh
antigen use oh-my-zsh

antigen bundle brew
antigen bundle brew-cask
antigen bundle bundler
antigen bundle git
antigen bundle gitfast
antigen bundle history
antigen bundle history-substring-search
antigen bundle npm
antigen bundle osx
antigen bundle rails
antigen bundle rvm
antigen bundle wd

# Antigen Bundles - elsewhere
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-syntax-highlighting

# Antigen Theme
antigen theme sorin

# Tell antigen that we're done.
antigen apply

unsetopt AUTO_CD

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Aliases

alias t='todo.sh'
