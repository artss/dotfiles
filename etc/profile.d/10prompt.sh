# Command prompt

__vcs_str() {
  str=$(__git_ps1 " git: %s")
  if [ "x$str" == "x" ]; then
    str=$(hg branch 2> /dev/null | awk '{print $1}')
    if [ "x$str" == "x" ]; then
      return
    else
      str=$(printf " hg: %s" "$str")
    fi
  fi
  echo "$str"
}

if [ "`id -u`" -eq 0 ]; then
  PS1='\[\033[01;31m\]\h\[\033[01;32m\] \W #\[\033[00m\] '
  PS2='\[\033[01;31m\]>\[\033[00m\] '
else
  PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \W\[\e[0;49;24m\]$(__vcs_str)\[\033[01;34m\] \$\[\033[00m\] '
  #PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00m\] '
  PS2='\[\033[01;32m\]>\[\033[00m\] '
fi

export PS1
export PS2
