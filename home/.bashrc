source /etc/profile

source $HOME/.nvm/nvm.sh
nvm use default

#case `tty` in 
#    /dev/tty[1])
#        echo -n "Starting X Window system"
#        echo startx
#    ;;
#esac
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
