# SSH agent

agent_vars_file="/tmp/ssh-agent-`whoami`"
key_file="$HOME/.ssh/id_rsa"

start_agent() {
    echo 'Starting SSH agent... '
    agent_vars=`ssh-agent`
    echo $agent_vars > $agent_vars_file
    chmod 600 $agent_vars_file
    . $agent_vars_file &>/dev/null
    #ssh-add $key_file
}

if [ -f $key_file ]; then
    if [ "x$SSH_AGENT_PID" == "x" ]; then
        if [ -f $agent_vars_file ];then
            . $agent_vars_file
            kill -0 $SSH_AGENT_PID &>/dev/null
            retval=$?
            if [ "x$retval" == "x1" ]; then
                start_agent
            fi
        else
            start_agent
        fi
    else
        kill -0 $SSH_AGENT_PID &>/dev/null
        retval=$?
        if [ "x$retval" == "x1" ]; then
            start_agent
        fi
    fi
fi
