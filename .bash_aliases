############################################################
#  aliases
############################################################
if [[ 'Darwin' == `uname` ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

alias l='ls -CF'
alias lrt='ls -lartkh'
alias ll='ls -lkh'
alias la='ls -a'
alias lla='la -la'
alias lrs='ls -larSkh'
alias lr='ls -R'
alias llr='ls -aRl'
alias clr='clear'
alias df='df -kTh'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias grep='grep --color=auto --exclude-dir="\.git" --exclude-dir="\.svn"'
alias egrep='egrep --color=auto --exclude-dir="\.git" --exclude-dir="\.svn"'
alias fgrep='fgrep --color=auto --exclude-dir="\.git" --exclude-dir="\.svn"'
alias t1='tail -n1'
alias h1='head -n1'
alias vi='vim'
alias g='git'
alias sbp="source $HOME/.bash_profile"
alias hr="cd $HOME/.homesick/repos"
alias rakeit="rake db:drop && rake db:create && rake db:migrate && rake db:seed"
alias downloads='cd /Users/${USER}/Downloads && open .'
alias workmode="spotify play uri spotify:user:$SPOTIFY_USERNAME:playlist:$WORK_PLAYLIST_URI && caffeinate -t 2700 &"
alias lock='if ! [[ $(spotify status | grep paused) ]]; then spotify pause; fi && /System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'
