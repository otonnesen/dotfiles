# <---------------------------------------------->
# Oh My Zsh
export ZSH="/home/oliver/.local/src/oh-my-zsh"

plugins=(
	vi-mode
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
# <---------------------------------------------->

# Colors
autoload -U colors && colors

# Prompt
# autoload -Uz promptinit
# promptinit
# prompt walters
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Load aliases and shortcuts
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# History settings
setopt histignorealldups
setopt append_history
setopt extended_history

# "Infinite" history
HISTFILE=~/.cache/zsh_history
HISTSIZE=999999999
SAVEHIST=999999999

# Use modern completion system
autoload -Uz compinit
zmodload zsh/complist
compinit

# Show hidden files
_comp_options+=(globdots)

# Set vi mode
setopt vi

# Turn off automatic directory change
unsetopt autocd

# Vim binds in tab menu
bindkey -M menuselect "h" vi-backward-char
bindkey -M menuselect "j" vi-down-line-or-history
bindkey -M menuselect "k" vi-up-line-or-history
bindkey -M menuselect "l" vi-forward-char

export KEYTIMEOUT=1

# What type is being completed
zstyle ":completion:*" format "Completing %d"
# Enable completion menu unconditionally
zstyle ":completion:*" menu select
# Configure ls colours
eval "$(dircolors -b)"
# Use same colours as `ls` for the completion list
zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}
zstyle ":completion:*" list-colors ""
# Group directories
zstyle ":completion:*" list-dirs-first true
# Ignore ./., ./.., etc.
zstyle ":completion:*" special-dirs false
# Colour pids/list all when killing
zstyle ":completion:*:*:kill:*:processes" list-colors "=(#b) #([0-9]#)*=0=01;31"
zstyle ":completion:*:kill:*" command "ps -u $USER -o pid,%cpu,tty,cputime,cmd"
