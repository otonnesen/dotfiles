# Set env vars; runs on login

# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
	fi
fi

# Default programs
export VISUAL="vim"
export EDITOR="vim"
export PAGER="less"
export TERMINAL="st"
export READER="zathura"
export BROWSER="qutebrowser"

# Move configs/caches/etc
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_LIB_HOME="$HOME/.local/lib"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export TERMINFO="$XDG_DATA_HOME/terminfo"
export XAUTHORITY="$XDG_CACHE_HOME/Xauthority"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export LESSHISTFILE="-"
export CALCURSE_DEFAULT_DIR="$HOME/Documents/calendar.school"
export GOPATH="$HOME/.local/src/go"
export RUSTUP_HOME="$HOME/.local/src/rustup"
export CARGO_HOME="$HOME/.local/src/cargo"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export INDENT_PROFILE="$XDG_CONFIG_HOME/indent.pro"
export PSQL_HISTORY="$XDG_CACHE_HOME/psql_history"
export NODE_REPL_HISTORY="$XDG_CACHE_HOME/node_repl_history"

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

# Program defaults
export LESS=-R

export PATH="$HOME/.cargo/bin:$PATH"
