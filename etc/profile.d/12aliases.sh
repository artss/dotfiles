# Aliases

# colors
export LS_OPTIONS='--color=auto'
#/mceval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias grep='grep --color'

# network
alias wget='wget -c'

#alias less='most'

# some directories
alias media='cd /media'
alias mnt='cd ~/mnt'
alias tmp='cd ~/tmp'
alias ~='cd ~'
alias etc='cd /etc'

# other
alias df='df -h'
alias mc='mc -d'
alias tmux='tmux -2'
alias tm='tmux -2 attach'

alias mi='speaker-test -t sine -f 329.6'

# mplayer
#alias mplayer='mplayer -vo vdpau -vc ffh264vdpau,ffmpeg12vdpau,ffwmv3vdpau,ffvc1vdpau, -zoom -framedrop'
#alias mplayer='mplayer -zoom -framedrop'
#alias mplayer='optirun mplayer -zoom -framedrop -osdlevel 3'

if [ "`id -u`" -eq 0 ]; then
        alias reboot="echo 'If you really want to reboot, use /sbin/reboot directly.'"
        alias halt="echo 'If you really want to shutdown, use /sbin/halt directly.'"
        alias shutdown="echo 'If you really want to shutdown, use /sbin/shutdown directly.'"
fi

alias dcu='docker-compose up'
