source /etc/profile

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PS1='\[\033[01;31m\]\h\[\033[01;32m\] \W #\[\033[00m\] '
export PS2='\[\033[01;31m\]>\[\033[00m\] '