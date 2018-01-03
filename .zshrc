# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME%%/}/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# Lambda (Mod) ZSH Theme: https://github.com/halfo/lambda-mod-zsh-theme
ZSH_THEME="powerlevel9k/powerlevel9k"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias vs="code ."
alias cl_memory="sudo bash -c 'sync; echo 3 > /proc/sys/vm/drop_caches'"
alias docker_shutdown="docker ps -a -q | xargs -L1 docker stop"
alias docker_rm_containers="docker ps -a -q -f status=exited | xargs -L1 docker rm -v"
alias docker_rm_images="docker images -f dangling=true -q | xargs -L1 docker rmi"
alias docker_rm_volumes="sudo docker images -q | xargs -L1 docker rmi"
alias docker_cleanup="docker_rm_containers ; docker_rm_images; docker_rm_volumes"
#alias tmux="TERM=screen-256color-bce tmux"
alias tmux="tmux -2"

# Android Config
#export ANDROID_HOME="${HOME%%/}/Android"
#export PATH="${PATH}:${ANDROID_HOME%%/}/tools/:${ANDROID_HOME%%/}/platform-tools/:${ANDROID_HOME%%/}/tools/bin/"

#export PYTHONHOME=/usr/local/lib/python3.5/
#export PYTHONPATH=/usr/local/lib/python3.5/

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"

#eval "$(gulp --completion=zsh)"
source ~/.git-flow-completion.zsh

function git-pull-all() {
    START=$(git symbolic-ref --short -q HEAD);
    for branch in $(git branch | sed 's/^.//'); do
        git checkout $branch;
        git pull ${1:-origin} $branch || break;
    done;
    git checkout $START;
};
export PATH="${PATH}:$(npm config get prefix)/bin:$HOME/.npm-packages/bin"
# Tmux autostart
#if [[ -z "$TMUX" ]]; then
#    tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
#fi
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
