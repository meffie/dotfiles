# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Look in home and legacy afs dirs for commmands.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/afs/bin:/usr/afsws/bin:/usr/afsws/etc:$PATH

# Use a simple prompt.
PS1='\h:\W\$ '

# Dont clear the screen after displaying man pages.
export PAGER='less -X'

# Dump full cores for debugging.
ulimit -c unlimited

# Append to the history file, don't overwrite it
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Enable color support of ls.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# Enable vi keybinding in bash
set -o vi

# Start and stop ssh-agent as needed.
function _ssh_add() {
    IDENT=${1-mmeffie-sna2}
    ASKPASS="/tmp/_ssh_askpass_$$.sh"
    echo "#!/bin/sh" >$ASKPASS
    echo "/usr/bin/pass ssh/$IDENT" >>$ASKPASS
    chmod +x $ASKPASS
    SSH_ASKPASS="$ASKPASS" DISPLAY=:0 ssh-add $HOME/.ssh/$IDENT </dev/null
    rm $ASKPASS
}

alias ssh-agent-start='test -z "$SSH_AGENT_PID" && eval `ssh-agent` && _ssh_add'
alias ssh-agent-stop='test -z "$SSH_AGENT_PID" || eval `ssh-agent -k`'

# Custom aliases, functions, and env vars
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
if [ -f ~/.bash_env ]; then
    . ~/.bash_env
fi
