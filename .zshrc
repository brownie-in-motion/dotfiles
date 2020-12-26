# zplug
source /usr/share/zsh/scripts/zplug/init.zsh

zplug 'lib/completion', from:oh-my-zsh
zplug 'lib/compfix', from:oh-my-zsh
zplug 'lib/directories', from:oh-my-zsh
zplug 'lib/key-bindings', from:oh-my-zsh
zplug 'lib/history', from:oh-my-zsh

zplug 'plugins/git', from:oh-my-zsh
zplug 'plugins/z', from:oh-my-zsh

zplug 'themes/kolo', from:oh-my-zsh

zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'zsh-users/zsh-history-substring-search'
zplug 'zsh-users/zsh-completions'

# history file
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# zsh options
setopt autocd extendedglob nomatch notify

# stuff
alias ls='ls --color=auto'
set -o vi

# python for nvim
alias python3="python"

# dotfile management
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# text editor
export EDITOR=vim

# add scripts to path
PATH="$PATH:/home/daniel/scripts"

zplug load
