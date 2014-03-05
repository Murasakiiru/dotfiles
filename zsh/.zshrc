# system-wide profile for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

### Preferences ###

export SVN_EDITOR=vim
export EDITOR=vim
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:~/Scripts:~/.config/wmfs/scripts
export MANPATH=$MANPATH:/opt/local/share/man

### Style ###

autoload -U colors && colors

### History ###

export HISTSIZE=5000
export SAVEHIST=$HISTSIZE
export HISTFILE="~/.zsh/history"

#don't add duplicate history
setopt HIST_IGNORE_ALL_DUPS
#each line is added to the history when it is executed
setopt INC_APPEND_HISTORY
#This means that zsh's running in different windows but on the same host (or more generally with the same home directory) share the same history
setopt SHARE_HISTORY
#Extended format for history
setopt EXTENDED_HISTORY


###
# List of options : http://zsh.sourceforge.net/Doc/Release/Options.html
###
#Correction of command (correctall -> even arguments)
setopt correct
#No need explanation : auto cd ...
setopt autocd
#Active extended globbing (http://www.refining-linux.org/archives/37/ZSH-Gem-2-Extended-globbing-and-expansion/)
#ex : ls **/foo     ls [^ab]    ls ^foo     ls ^(foo|bar)   
###
#   ls -l **/([^A-Z[:digit:]])##(#q.x^X^u1002Lm+30mM-1)
###
setopt extendedglob
#When completion, put cursor to the end
setopt always_to_end

### Keyboard ###
### BindKeys ###
#WIP Dans un fichier à part

### Auto Completion ###

#Enable completion
autoload -U compinit && compinit

# Menu style with navigation with arrow
zstyle ':completion:*:*:*' menu yes select

#Completion for kill -SIGNAL <TAB>
#List the process to kill
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"


zstyle ':completion:*' list-colors "$LS_COLORS"
zstyle ':completion:*:warnings' format $'%{\e[0;31m%}Sorry, no matches.%{\e[0m%}'
#zstyle ':completion:*:descriptions' no

#zstyle ':completion:*:*:kill:*' verbose yes
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:kill:*' command 'ps -A -o pid,%cpu,%mem,comm'


# Options
zstyle ':completion:*:options'         auto-description '%d'               #
zstyle ':completion:*:options'         description 'yes'   

# Last word
insert-last-typed-word() { zle insert-last-word -- 0 -1 }; \
  zle -N insert-last-typed-word; bindkey "\em" insert-last-typed-word

### Functions ###
#Fonction tunnel Support#
source ~/.zsh/support
#Fonctions de base
source ~/.zsh/function
#Alias de base
source ~/.zsh/alias
#Prompt
source ~/.zsh/prompt
