source "$HOME/dotfiles/etc/profile.d/10prompt.sh"
source "$HOME/dotfiles/etc/profile.d/20histcontrol.sh"
source "$HOME/dotfiles/home/osx/git-prompt.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -f "$HOME/dotfiles/home/osx/git-completion.bash" ]; then
  . "$HOME/dotfiles/home/osx/git-completion.bash"
fi
