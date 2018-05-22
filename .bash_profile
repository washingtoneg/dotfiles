# .bash_profile

# Source global definitions
if [ -f "$HOME/.bashrc" ]; then
  echo 'sourcing .bashrc'
  . "$HOME/.bashrc"
fi

# Source private definitions
if [ -f "$HOME/.bash_private" ]; then
  echo 'sourcing .bash_private'
  . "$HOME/.bash_private"
fi

# Source work-specific definitions
if [ -f "$HOME/.bash_work_specific" ]; then
  echo 'sourcing .bash_work_specific'
  . "$HOME/.bash_work_specific"
fi

# Get the aliases and functions
if [ -f "$HOME/.bash_aliases" ]; then
  echo 'sourcing .bash_aliases'
  . "$HOME/.bash_aliases"
fi

if [ -f "$HOME/.bash_func" ]; then
  echo 'sourcing .bash_func'
  . "$HOME/.bash_func"
fi

# add home bin
if [ -d "$HOME/bin" ] ; then
  PATH=$PATH:$HOME/bin
fi

# Adding bash and git completion
if echo $HOSTNAME | grep -qi "elena"; then
  command -v brew > /dev/null
  if [[ $? == 0 ]]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
      echo "sourcing $(brew --prefix)/etc/bash_completion"
      . $(brew --prefix)/etc/bash_completion
    fi
  fi
fi

if [ -f ~/.git-completion.bash ]; then
  echo 'sourcing .git-completion.bash'
  . ~/.git-completion.bash
fi

if [ -f "$scratch/vboxmanage-bash-completion/VBoxManage" ]; then
  . "$scratch/vboxmanage-bash-completion/VBoxManage"
fi

export PATH
