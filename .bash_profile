# .bash_profile

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Get the aliases and functions
# if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
  . "$HOME/.bash_aliases"
# fi

# add home bin
if [ -d "$HOME/bin" ] ; then
  PATH=$PATH:$HOME/bin
fi

if echo $HOSTNAME | grep -qi "elena"; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
  fi
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
eval $(thefuck --alias)
