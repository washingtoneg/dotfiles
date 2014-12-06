# .bash_profile

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Get the aliases and functions
if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

# Get opower remote profile
if [ -f "$HOME/.bash_opwr_rmt" ]; then
  . "$HOME/.bash_opwr_rmt"
fi

# if running locally use local profile
if [ -f "$HOME/.bash_opwr_home" ]; then
  . "$HOME/.bash_opwr_home"
fi

# add home bin
if [ -d "$HOME/bin" ] ; then
  PATH=$PATH:$HOME/bin
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
