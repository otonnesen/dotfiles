# Set env vars; runs on login

# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
	fi
fi

# Default programs
export BROWSER="firefox"
export EDITOR="nvim"
export PAGER="less"
export READER="zathura"
export TERMINAL="st"
export VISUAL="nvim"

# Move configs/caches/etc
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_LIB_HOME="$HOME/.local/lib"

export CALCURSE_DEFAULT_DIR="$HOME/Documents/calendar.school"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export GOPATH="$HOME/.local/src/go"
export INDENT_PROFILE="$XDG_CONFIG_HOME/indent.pro"
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export LESSHISTFILE="-"
export NODE_REPL_HISTORY="$XDG_CACHE_HOME/node_repl_history"
export PSQL_HISTORY="$XDG_CACHE_HOME/psql_history"
export RUSTUP_HOME="$HOME/.local/src/rustup"
export TERMINFO="$XDG_DATA_HOME/terminfo"
export XAUTHORITY="$XDG_CACHE_HOME/Xauthority"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export VIFM="$XDG_CONFIG_HOME/vifm"

# Add personal bin
PATH="$XDG_BIN_HOME:$PATH"

# Add texlive path
PATH="$HOME/.local/src/texlive/2019/bin/x86_64-linux:$PATH"

# Add polybar path
PATH="$HOME/.local/src/polybar/build/bin:$PATH"

# Add Go bin
PATH="/usr/local/go/bin:$PATH"

# Add GOPATH bin
PATH="$GOPATH/bin:$PATH"

# Add Node bin
PATH="$HOME/.local/src/node/bin:$PATH"

# Add nvim bin
PATH="$HOME/.local/src/nvim/bin:$PATH"

# Add nightly nvim bin
PATH="$HOME/.local/src/nvim-0.7.0/bin:$PATH"

# Add GHC bin
PATH="$HOME/.local/src/.ghcup/bin:$PATH"

# GHCup env
[ -f "/home/oliver/.ghcup/env" ] && source "/home/oliver/.ghcup/env" # ghcup-env

# Add Cabal bin
PATH="$HOME/.cabal/bin:$PATH"

# Poetry bin
export PATH="$HOME/.poetry/bin:$PATH"

# Program defaults
export LESS=-R

# Add fly.io bin
export FLYCTL_INSTALL="/home/oliver/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
