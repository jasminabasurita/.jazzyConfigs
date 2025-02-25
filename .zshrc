archey | lolcat

export SUDO_EDITOR=nvim

# local path
export PATH=$PATH:~/.bin

# Auto Completion
autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES
# Suggest a package to download when command not found
source /usr/share/doc/pkgfile/command-not-found.zsh
# Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Python Virtual Environments
source /usr/bin/virtualenvwrapper.sh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Source asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# Hook direnv into zsh
eval "$(direnv hook zsh)"

export DEV_SCRIPTS_DIR=~/Instinct/dev_scripts

source $DEV_SCRIPTS_DIR/init_dev_scripts.sh

#ART
# export ART_PASSPHRASE=ce9ieGheelaegh0rohj9

# NPM Token
# export NPM_TOKEN=`cat ~/.npmrc | grep authToken | tr "=" "\n" | tail -n 1`

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="agnoster"
# ZSH_THEME="risto"
# ZSH_THEME="avit"
ZSH_THEME="jazzy"
# ZSH_THEME="dracula"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
# Add wisely, as too many plugins slow down shell startup.
plugins=(git archlinux)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


alias vim=nvim
alias gs="git status"
alias gdlm="git diff --name-only master"
alias cl="xclip -selection clipboard"
alias sudo="sudo " #hack to allow aliases when using sudo

# NPM Aliases
alias npmg="sudo npm i -g"
alias npms="npm i -s"
alias npmd="npm i --save-dev"
alias npmst="npm start"
alias npmt="npm test"
alias npmr="npm run"
alias npmrsd="npm run start-dev"
alias psync="rsync -a --partial --info=progress2"
alias pac-size="pacman -Qi | egrep '^(Name|Installed)' | cut -f2 -d':' | paste - - | column -t | sort -nrk 2 | grep MiB | less"

# Docker Aliases
alias dock="docker-compose "
alias drma="docker-compose run --rm app "
alias dock-test="docker-compose run --rm app yarn run test"
alias dock-lint="docker-compose run --rm app yarn run lint"
alias dock-install="docker-compose run --rm app yarn install"
alias dock-rebuild="docker-compose kill && docker-compose down && docker-compose up --build"
alias dock-drop="sudo iptables -F DOCKER-ISOLATION-STAGE-2 && sudo iptables -F DOCKER-ISOLATION-STAGE-1"
alias dock-add="sudo route add -net 172.17.0.0/17 gw 10.157.157.249; sudo route add -net 172.17.128.0/17 gw 10.157.157.249;"
alias chkipt="sudo iptables -L -v"
alias dock-atomic="docker system prune -af --volumes"
alias dub="docker-compose up --build --force-recreate"
alias dpsql="docker-compose run --rm postgres psql postgresql://postgres@postgres:5432/"
alias dump="-e POSTGRES_VERSION=12 dump-db $(basename $PWD) "
alias takeadump='art -on rise-stage -e POSTGRES_VERSION=12 dump-db $(basename $PWD)'

# art aliases
alias arto="art -on "
alias rs="rise-stage "
alias artm="mitmproxy --listen-port 8080 --showhost"

# yarn aliases
alias yr="yarn run "
alias yi="yarn install "

# git aliases
alias gsha="git rev-parse HEAD | xclip -selection clipboard"

function gitit {
  git add --all
  git commit -m $1
}

function gititdone {
  git add --all
  git commit -m $1
  git push
}

moveAndSwitch() {
  wmctrl -r ":ACTIVE:" -t $1 & wmctrl -s $1
}

concon () {
  case "$1" in
    "prod") profile=prod ;;
    "stage") profile=default ;;
  esac
  ip=$(aws ec2 --profile $profile describe-instances --filters "Name=tag:App,Values=$2" "Name=instance-state-name,Values=running" --query 'Reservations[0].Instances[0].PrivateIpAddress' --output text)
  echo "connecting to $ip"
  ssh -t $ip concon ${@:3}
}

# bindkey -v
# export KEYTIMEOUT=20
# bindkey -M viins 'jk' vi-cmd-mode
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
