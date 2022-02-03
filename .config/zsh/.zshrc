# Vi mode stuff
source /home/oliver/.config/zsh/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh
MODE_CURSOR_VICMD="green block"
MODE_CURSOR_VIINS="#20d08a blinking bar"
MODE_CURSOR_SEARCH="#ff00ff steady underline"

# MODE_INDICATOR_VIINS='%F{15}<%F{8}INSERT<%f'
# MODE_INDICATOR_VICMD='%F{10}<%F{2}NORMAL<%f'
# MODE_INDICATOR_REPLACE='%F{9}<%F{1}REPLACE<%f'
# MODE_INDICATOR_SEARCH='%F{13}<%F{5}SEARCH<%f'
# MODE_INDICATOR_VISUAL='%F{12}<%F{4}VISUAL<%f'
# MODE_INDICATOR_VLINE='%F{12}<%F{4}V-LINE<%f'

# Colors
autoload -U colors && colors

PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%3~%{$fg[red]%}]%{$reset_color%}$%b "

if [[ $IN_NIX_SHELL ]]; then
    PS1="(nix-shell) $PS1"
fi

# Load aliases and shortcuts
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# History settings
setopt histignorealldups
setopt append_history
setopt extended_history
# Ensure history movement commands do not visit imported lines
zle -N set-local-history	
# zle set-local-history

# "Infinite" history
HISTFILE=~/.cache/zsh_history
HISTSIZE=999999999
SAVEHIST=999999999

# Use modern completion system
autoload -Uz compinit
zmodload zsh/complist

# Add Rust completions
fpath+="$ZDOTDIR/functions"

# Add Nix completions
source $ZDOTDIR/plugins/nix-zsh-completions/nix-zsh-completions.plugin.zsh
fpath=($ZDOTDIR/plugins/nix-zsh-completions $fpath)

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

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$HOME/.poetry/bin:$PATH"

eval "$(direnv hook zsh)"
