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

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export TERMINFO="$HOME/.local/share/terminfo"
export XAUTHORITY="$XDG_CACHE_HOME/Xauthority"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export LESSHISTFILE="-"
export CALCURSE_DEFAULT_DIR="$HOME/Documents/calendar.school"
export GOPATH="$HOME/.local/src/go"
export RUSTUP_HOME="$HOME/.local/src/rustup"
export CARGO_HOME="$HOME/.local/src/cargo"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"

# Add personal bin
PATH="$HOME/.local/bin:$PATH"

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
