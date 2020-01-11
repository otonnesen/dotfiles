# Set env vars; runs on login

# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
	fi
fi

PATH="$HOME/.local/bin:$PATH"

# Add texlive path
PATH="$HOME/.local/texlive/2019/bin/x86_64-linux:$PATH"

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
export ZDOTDIR="$HOME/.config/zsh"
export TERMINFO="$HOME/.local/share/terminfo"
export XAUTHORITY="$HOME/.cache/Xauthority"
export GNUPGHOME="$HOME/.config/gnupg"
export LESSHISTFILE="-"
export CALCURSE_DEFAULT_DIR="$HOME/Documents/calendar.school"

# Program defaults
export LESS=-R
