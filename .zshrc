# to install change goroot to your system 
# then touch .cache/zsh/history
# install 
# ZSHRC - fast
# inspired by lukes zoomer shell

# Requirements:
# lf, zsh-syntax-higlighting, zsh-autosuggestions, zsh-history-substring-searc

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%~%{$fg[red]%}]%{$reset_color%} $%b "$'\n'"%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M%{$fg[red]%}]%{$reset_color%} > %b"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory

# Basic auto/tab complete:
autoload -U compinit
#zstyle ':completion:*' menu select
zstyle ':completion:*' menu select matcher-list 'm:{a-z}={A-Za-z}'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

bindkey -e
export KEYTIMEOUT=1
export EDITOR=nvim

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/dotfiles/aliassrc" ] && source "$HOME/dotfiles/aliassrc"
[ -f "$HOME/.tokens" ] && source "$HOME/.tokens"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


source /usr/share/nvm/init-nvm.sh


#Paths
export JAVA_HOME=/usr/lib/jvm/java-15-openjdk/
export JAR=/usr/share/java/jdtls/features/org.eclipse.equinox.executable_3.8.1100.v20210209-1541.jar
export GRADLE_HOME=/usr/share/java/gradle
export JDTLS_CONFIG=/usr/share/java/jdtls/config_linux
export WORKSPACE=$HOME/Developer/java/

