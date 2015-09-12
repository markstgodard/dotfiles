# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="markstgodard"

# Disable weekly update checks
DISABLE_AUTO_UPDATE="true"

# Disable auto-setting of terminal title
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby bundler rails)

source $ZSH/oh-my-zsh.sh

# fasd
eval "$(fasd --init auto)"

# add dirvenv hook
eval "$(direnv hook zsh)"

# editor
export EDITOR='vim'

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
RUBIES+=(~/.rvm/rubies/*)
source /usr/local/opt/chruby/share/chruby/auto.sh

# ignore specific commands in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help:pony:pony *";
