# General
# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
export EDITOR='nvim'

# alias
alias zshconfig="vim ~/.zshrc"
alias vim="nvim"
alias gg="lazygit"
# HSTR configuration - add this to ~/.zshrc
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor,raw-history-view       # get more colors, default fav view

# Save history
HISTFILE=~/.zsh_history # location of the history file
export HISTFILESIZE=10000000 # history limit of the file on disk
export HISTSIZE=10000000 # current session's history limit, also following this https://unix.stackexchange.com/a/595475 $HISTSIZE should be at least 20% bigger than $SAVEHIST 
export SAVEHIST=500000 # zsh saves this many lines from the in-memory history list to the history file upon shell exit
setopt INC_APPEND_HISTORY # history file is updated immediately after a command is entered
setopt SHARE_HISTORY # allows multiple Zsh sessions to share the same command history 
setopt EXTENDED_HISTORY # records the time when each command was executed along with the command itself
setopt APPENDHISTORY # ensures that each command entered in the current session is appended to the history file immediately after execution
export HISTTIMEFORMAT="%d/%m/%Y %H:%M] "
