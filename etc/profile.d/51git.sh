#!/bin/sh
# Git aliases

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
  . /etc/bash_completion.d/git-prompt
  . /usr/share/bash-completion/completions/git
fi

alias g='git'

function_exists() {
  declare -f -F $1 > /dev/null
  return $?
}

#for al in `__git_aliases`; do
for al in $(git config --get-regexp '^alias\.' | cut -f 1 -d ' ' | cut -f 2 -d '.'); do
  alias g$al="git $al"

  complete_func=_git_$(__git_aliased_command $al)
  function_exists $complete_fnc && __git_complete g$al $complete_func
done
