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

