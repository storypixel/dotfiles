# Browser

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# Editors

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# Language

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Source Antigen
source ~/.antigen.zsh

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
# BASE16_SHELL="$HOME/.config/base16-shell/base16-ashes.dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# NVM
source ~/.nvm/nvm.sh

# Aliases

## Todo.sh
export TODOTXT_DEFAULT_ACTION=ls
alias t='todo.sh'

## Notes
### Snagged this from Lifehacker
### http://lifehacker.com/5592047/turn-your-command-line-into-a-fast-and-simple-note-taking-tool

n() {
        $EDITOR ~/Dropbox-Personal/Dropbox/notes/"$*".md
}

nls() {
        ls -c ~/Dropbox-Personal/Dropbox/notes/ | grep "$*"
}

# rbenv was installed with brew, and this next line was required by rbenv iff installed with brew
eval "$(rbenv init -)"
