#  ____  ____  
# |  _ \/ ___|   
# | |_) \___ \   Author: Rohit   
# |  _ < ___) |  Script: ~/.bashrc 
# |_| \_\____/   License: MIT License 
#
# https://rohitknows.github.io
# For-ssh-and-sftp
# phone_ip='192.168.29.27'
# phone_port='8022'

source $HOME/.kube/autocompl.sh
source /usr/share/autojump/autojump.bash
export PATH=$PATH:$HOME/.config/emacs/bin
export PATH=$PATH:$HOME/.local/bin
source /usr/share/doc/fzf/examples/key-bindings.bash

# alias ciri="~/.local/bin/sgpt"
alias sshphone="ssh -p '$phone_port' '$phone_ip' "
alias sftpphone="sftp -P '$phone_port' '$phone_ip' " 
# ---**---**---**------**---**---**------**---**---**--- 

# shuf -n 2 ~/bin/words.txt | pv -qL 50 | lolcat

# ---**---**---**------**---**---**------**---**---**--- 

# Inside-adb-shell
# alias listpkg='adb shell pm list packages | grep '
# alias removepkg='adb shell pm uninstall -k user 0 '
# alias reinstall='adb shell pm install-existing '
# ---**---**---**------**---**---**------**---**---**--- 

alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias open='xdg-open'
alias notes='cd ~/development/notes/'
alias edrc='vim ~/.bashrc'
alias alpha='cat ~/Documents/creds/alpha/rohit-devops_credentials.csv'
alias glg='git log --oneline --graph'
# alias duo='brave-browser --app="https://duolingo.com"'
#alias emacs="emacsclient -c -a 'vim'"

# ----**--**----
# For git
alias ga='git add'
alias gp='git push'
alias gm='git commit -m'

#alias dused='du -h | tail -n 1 | cut -f 1' 
alias pics="sxiv ~/Pictures/*"
alias pdf='zathura "$(find ~/Documents -type f -iname "*.pdf" | fzf)"'
alias hist='history | cut -c 8-| sort | uniq | fzf |tr -d "\n"| xclip -sel c'
#alias music='
#    mpv --no-video "`find /media/shawn/backup/Music -type f -iname "*.mp3" -o -iname "*.ogg" | fzf`" 
#    mpv --no-video --shuffle=yes /media/shawn/backup/Music
#    '
sendFile(){
    file="file=@$1"
    curl -s -F$file https://0x0.st |tr -d '\n'| xclip -sel c
}

#setbg(){
#    sxiv /media/shawn/backup/Pictures/anime/
#}

myip(){
   ipstore=`ifconfig | grep "inet " | awk 'NR>1{print $2}'`
   echo "$ipstore"
   echo -n "$ipstore" | xclip -sel c
}


# ---**---**---**------**---**---**------**---**---**--- 

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#starship prompt added by me
eval "$(starship init bash)"



# Load Angular CLI autocompletion.
#source <(ng completion script)
export PATH=$HOME/bin:$PATH
export PATH="$PATH:/opt/mssql-tools18/bin"
