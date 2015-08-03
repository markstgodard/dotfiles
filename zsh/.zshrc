# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="markstgodard"

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

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH


# START build.zsh
# travis
[ -f /Users/mark/.travis/travis.sh ] && source /Users/mark/.travis/travis.sh

# Gradle
export GRADLE_HOME=/Users/mark/Development/tools/gradle-2.1
export PATH=$GRADLE_HOME/bin:$PATH

# Ant
export ANT_HOME=~/Development/tools/apache-ant-1.9.4

# Maven
export MAVEN_HOME=~/Development/tools/apache-maven-3.2.3
export PATH=$PATH:/usr/local/sbin:$ANT_HOME/bin:$MAVEN_HOME/bin:/usr/local/bin

# END build.zsh

# Oracle?
export DYLD_LIBRARY_PATH=/Users/mark/Development/tools/instantclient_11_2

# moved to postgres.zsh
# postgres
export PGHOST=localhost
export PATH=/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH
# moved to postgres.zsh

# lets save 2 keystrokes
alias v="vim"
alias cls="clear"
alias h="history"

# why not at this point
alias gut="git"
alias got="git"

# CF aliases
alias dammit='bosh create release --force && bosh target 192.168.50.4 lite && ./bosh-lite/make_manifest && bosh -n upload release && bosh -n deploy'

# fasd
eval "$(fasd --init auto)"

# RVM
source ~/.profile

export EDITOR='vim'

# as per IBM Constainers documentation
export DOCKER_TLS_VERIFY=1


export PATH=$PATH:/usr/local/opt/go/libexec/bin

# go
export GOROOT=/usr/local/go
export GOPATH=~/workspace/go
export PATH=$GOPATH/bin:$PATH


export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
