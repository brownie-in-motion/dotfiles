zmodload zsh/zprof

# zshenv
source /home/daniel/.zshenv

# zplug
# source /home/daniel/projects/zplug/init.zsh
source /usr/share/zinit/zinit.zsh

# zplug 'lib/completion', from:oh-my-zsh
# zplug 'lib/compfix', from:oh-my-zsh
# zplug 'lib/directories', from:oh-my-zsh
# zplug 'lib/key-bindings', from:oh-my-zsh
# zplug 'lib/history', from:oh-my-zsh
#
# zplug 'plugins/git', from:oh-my-zsh
# zplug 'plugins/z', from:oh-my-zsh
#
# zplug 'themes/kolo', from:oh-my-zsh
#
# zplug 'zsh-users/zsh-syntax-highlighting', defer:2
# zplug 'zsh-users/zsh-history-substring-search'
# zplug 'zsh-users/zsh-completions'
# zplug 'zsh-users/zsh-autosuggestions'
#
# zplug 'lukechilds/zsh-nvm'

zi snippet OMZ::lib/completion.zsh
zi snippet OMZ::lib/compfix.zsh
zi snippet OMZ::lib/directories.zsh
zi snippet OMZ::lib/key-bindings.zsh
zi snippet OMZ::lib/history.zsh

zi snippet OMZ::plugins/git/git.plugin.zsh
zi snippet OMZ::plugins/z/z.plugin.zsh

zi snippet OMZ::themes/kolo.zsh-theme

zi ice wait lucid
zi load zsh-users/zsh-syntax-highlighting

zi load zsh-users/zsh-history-substring-search
zi load zsh-users/zsh-completions
zi load zsh-users/zsh-autosuggestions

zi ice wait lucid
zi load lukechilds/zsh-nvm

# history file
HISTSIZE=100000
SAVEHIST=100000

# zsh options
setopt autocd extendedglob nomatch notify

# stuff
alias ls='ls --color=auto'
alias grep='grep --color=auto'
set -o vi

# pwninit
alias pwninit='/usr/bin/pwninit --template-path ~/.config/pwninit/template.py'

# python for nvim
alias python3="python"

# dotfile management
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias wget='/usr/bin/wget --hsts-file="$XDG_CACHE_HOME"/wget-hsts'
alias yarn="/usr/bin/yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"
alias berry="HOME=/tmp /usr/bin/yarn"

# text editor
export EDITOR=nvim

# add scripts to path
PATH="$PATH:/home/daniel/.local/share/gem/ruby/3.0.0/bin"
PATH="$PATH:$CABAL_DIR/bin"
PATH="$PATH:$GOPATH/bin"
PATH="/home/daniel/.local/share/npm/bin:$PATH"
PATH="/home/daniel/.local/share/cargo/bin:$PATH"
PATH="/home/daniel/.config/emacs/bin:/home/daniel/scripts:$PATH:/home/daniel/.local/bin"
PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

kitty + complete setup zsh | source /dev/stdin
