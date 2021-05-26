# Set env vars; runs on login

# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
	fi
fi

# Default programs
export BROWSER="qutebrowser"
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
export CARGO_HOME="$HOME/.local/src/cargo"
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

# Add personal bin
PATH="$XDG_BIN_HOME:$PATH"

# Add texlive path
PATH="$HOME/.local/src/texlive/2019/bin/x86_64-linux:$PATH"

# Add Go bin
PATH="/usr/local/go/bin:$PATH"

# Add GOPATH bin
PATH="$GOPATH/bin:$PATH"

# Add Cargo bin
PATH="$CARGO_HOME/bin:$PATH"

# Add Node bin
PATH="$HOME/.local/src/node/bin:$PATH"

# Add nvim bin
PATH="$HOME/.local/src/nvim/bin:$PATH"

# Add GHC bin
PATH="$HOME/.local/src/.ghcup/bin:$PATH"

# Add Cabal bin
PATH="$HOME/.cabal/bin:$PATH"

# Program defaults
export LESS=-R
