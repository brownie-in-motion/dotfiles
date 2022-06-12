# almost certainly unecessary but why not
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CACHE_HOME="$HOME"/.cache

# zsh history file somewhere else please
export HISTFILE="$XDG_DATA_HOME/zsh/history"

# dotfiles
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export _Z_DATA="$XDG_DATA_HOME"/z
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export DOT_SAGE="$XDG_CONFIG_HOME"/sage
export GDBHISTFILE="$XDG_DATA_HOME"/gdb/history
export DOOMDIR="$XDG_CONFIG_HOME"/doom
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config
export GOPATH="$XDG_DATA_HOME"/go
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export MATHEMATICA_USERBASE="$XDG_CONFIG_HOME"/mathematica
export MAXIMA_USERDIR="$XDG_CONFIG_HOME"/maxima
export DOT_SAGE="$XDG_CONFIG_HOME"/sage
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export CABAL_CONFIG="$XDG_CONFIG_HOME"/cabal/config
export CABAL_DIR="$XDG_CACHE_HOME"/cabal
export STACK_ROOT="$XDG_DATA_HOME"/stack


# theme
export GTK_THEME=Adwaita:dark

# hidpi
export QT_AUTO_SCREEN_SET_FACTOR=0
export QT_SCALE_FACTOR=2
export QT_FONT_DPI=96
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export VMARGS=-Dsun.java2d.uiScale=2
export ANKI_NOHIGHDPI=1

export ZDOTDIR=$HOME/.config/zsh
export ZPLUG_HOME=$HOME/projects/zplug
export ZPLUG_BIN=$HOME/projects/zplug/bin
export ZPLUG_REPOS=$HOME/projects/zplug/repos
export ZPLUG_LOADFILE=$HOME/projects/zplug/packages.zsh
export ZPLUG_CACHE_DIR=$HOME/projects/zplug/cache
export ZSH_AUTOSUGGEST_STRATEGY=(completion history)

export STARDICT_DATA_DIR=/home/daniel/media/books/dictionary

# gradle uhhhh
export GRADLE_OPTS="-Djavafx.verbose=true -Djavafx.debug=true -Dprism.verbose=true -Dprism.debug=true -Dquantum.verbose=true -Dquantum.debug=true -Dquantum.pulsedebug=true -Dprism.order=sw"
