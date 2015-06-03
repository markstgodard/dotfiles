# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="chris"

# Disable weekly update checks
DISABLE_AUTO_UPDATE="true"

# Disable auto-setting of terminal title
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# added by travis gem

export PGHOST=localhost

[ -f /Users/mark/.travis/travis.sh ] && source /Users/mark/.travis/travis.sh

# Always work in a tmux session if tmux is installed
#if which tmux 2>&1 >/dev/null; then
# if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
#       tmux attach -t hack || tmux new -s hack; exit
#    fi
#fi


export GOROOT=/usr/local/go
export GOPATH=$HOME/Development/go

export GRADLE_HOME=/Users/mark/Development/tools/gradle-2.1
export PATH=$GRADLE_HOME/bin:$PATH


export ANT_HOME=~/Development/tools/apache-ant-1.9.4
export MAVEN_HOME=~/Development/tools/apache-maven-3.2.3

export PATH=$PATH:/usr/local/sbin:$ANT_HOME/bin:$MAVEN_HOME/bin:/usr/local/bin


export DYLD_LIBRARY_PATH=/Users/mark/Development/tools/instantclient_11_2


# after yosemite upgrade aliased to mvim -v ????
# unalias vim
#alias vim '/usr/local/bin/vim'

# lets save 2 keystrokes
alias v="vim"
alias cls="clear"
alias h="history"

# why not at this point
alias gut="git"
alias got="git"

# RVM
source ~/.profile

export NVM_DIR="/Users/mark/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


export EDITOR='vim'

# as per IBM Constainers documentation
export DOCKER_TLS_VERIFY=1


export PATH=$PATH:/usr/local/opt/go/libexec/bin

export GOPATH=~/Development/platform-enhancement/workspace
export PATH=$GOPATH/bin:$PATH


export PATH=/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH

export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
