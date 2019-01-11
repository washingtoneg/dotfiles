############################################################
# .bashrc
############################################################

#LANG=C

# If not running interactively, don't do anything
if [[ -n "$PS1" ]]; then
  # append to the history file, don't overwrite it
  shopt -s histappend

  # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
  HISTSIZE=1000
  HISTFILESIZE=2000

  # don't put duplicate lines in the history. See bash(1) for more options
  # ... or force ignoredups and ignorespace
  HISTCONTROL=ignoredups:ignorespace

  # add timestamps to history
  HISTTIMEFORMAT='%F %T '

  # no empty command completion
  shopt -s no_empty_cmd_completion

  # enable command completion
  complete -C '/usr/local/bin/aws_completer' aws

  # check the window size after each command and, if necessary,
  # update the values of LINES and COLUMNS.
  shopt -s checkwinsize

  export TERM='xterm-256color'

  # set tput colors
  TXTBLD=$(tput bold)
  BLACK=$(tput setaf 0)
  RED=$(tput setaf 1)
  GREEN=$(tput setaf 2)
  YELLOW=$(tput setaf 3)
  BLUE=$(tput setaf 4)
  PURPLE=$(tput setaf 5)
  CYAN=$(tput setaf 6)
  WHITE=$(tput setaf 7)
  INVIS=$(tput civis)
  VIS=$(tput cnorm)
  RESET=$(tput sgr0)

  #use_color=false

  export CLICOLOR=1
  #export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
  export LSCOLORS=gx
  alias ls='/bin/ls -F'

  # Customize BASH PS1 prompt to show current GIT repository and branch
  Color_Off="\[\033[0m\]"       # Text Reset

  # Regular Colors
  Black="\[\033[0;30m\]"        # Black
  Red="\[\033[0;31m\]"          # Red
  Green="\[\033[0;32m\]"        # Green
  Yellow="\[\033[0;33m\]"       # Yellow
  Blue="\[\033[0;34m\]"         # Blue
  Purple="\[\033[0;35m\]"       # Purple
  Cyan="\[\033[0;36m\]"         # Cyan
  White="\[\033[0;37m\]"        # White

  # Bold
  BBlack="\[\033[1;30m\]"       # Black
  BRed="\[\033[1;31m\]"         # Red
  BGreen="\[\033[1;32m\]"       # Green
  BYellow="\[\033[1;33m\]"      # Yellow
  BBlue="\[\033[1;34m\]"        # Blue
  BPurple="\[\033[1;35m\]"      # Purple
  BCyan="\[\033[1;36m\]"        # Cyan
  BWhite="\[\033[1;37m\]"       # White

  # Underline
  UBlack="\[\033[4;30m\]"       # Black
  URed="\[\033[4;31m\]"         # Red
  UGreen="\[\033[4;32m\]"       # Green
  UYellow="\[\033[4;33m\]"      # Yellow
  UBlue="\[\033[4;34m\]"        # Blue
  UPurple="\[\033[4;35m\]"      # Purple
  UCyan="\[\033[4;36m\]"        # Cyan
  UWhite="\[\033[4;37m\]"       # White

  # Background
  On_Black="\[\033[40m\]"       # Black
  On_Red="\[\033[41m\]"         # Red
  On_Green="\[\033[42m\]"       # Green
  On_Yellow="\[\033[43m\]"      # Yellow
  On_Blue="\[\033[44m\]"        # Blue
  On_Purple="\[\033[45m\]"      # Purple
  On_Cyan="\[\033[46m\]"        # Cyan
  On_White="\[\033[47m\]"       # White

  # High Intensty
  IBlack="\[\033[0;90m\]"       # Black
  IRed="\[\033[0;91m\]"         # Red
  IGreen="\[\033[0;92m\]"       # Green
  IYellow="\[\033[0;93m\]"      # Yellow
  IBlue="\[\033[0;94m\]"        # Blue
  IPurple="\[\033[0;95m\]"      # Purple
  ICyan="\[\033[0;96m\]"        # Cyan
  IWhite="\[\033[0;97m\]"       # White
  IORANGE="\\033[38;5;166m"     # Orange

  # Bold High Intensty
  BIBlack="\[\033[1;90m\]"      # Black
  BIRed="\[\033[1;91m\]"        # Red
  BIGreen="\[\033[1;92m\]"      # Green
  BIYellow="\[\033[1;93m\]"     # Yellow
  BIBlue="\[\033[1;94m\]"       # Blue
  BIPurple="\[\033[1;95m\]"     # Purple
  BICyan="\[\033[1;96m\]"       # Cyan
  BIWhite="\[\033[1;97m\]"      # White

  # High Intensty backgrounds
  On_IBlack="\[\033[0;100m\]"   # Black
  On_IRed="\[\033[0;101m\]"     # Red
  On_IGreen="\[\033[0;102m\]"   # Green
  On_IYellow="\[\033[0;103m\]"  # Yellow
  On_IBlue="\[\033[0;104m\]"    # Blue
  On_IPurple="\[\033[10;95m\]"  # Purple
  On_ICyan="\[\033[0;106m\]"    # Cyan
  On_IWhite="\[\033[0;107m\]"   # White

  Time24h="\t"
  PathShort="\W"
  PathFull="\w"
  NewLine="\n"
  HostName="\h"
  UserName="\u"
  Jobs="\j"

  function soho_pwd() {
    # svn info
    stat .svn > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        SURL=`svn info | grep URL | head -1 | perl -pe 's/URL: (.*)/\1/'`
        if [ `echo $SURL | grep -E "branches|tags"` ]; then
          SVER=`echo $SURL | perl -pe 's{.*/(branches|tags)/(.*)}{\1/\2}' | cut -d/ -f1-2`
          SPTH=`echo $SURL | perl -pe 's{.*svnroot/(.*)/(branches|tags)/.*}{/\1}'`
          SPWD="$SPTH/$SVER"
          SCL=$IGreen
        else
          SPWD=`echo $SURL | perl -pe 's{.*svnroot/(.*)/trunk(.*)}{/\1/trunk}'`
          SCL=$IYellow
        fi
        svn status | egrep '.+' > /dev/null 2>&1
        if [ $? -eq 0 ]; then
          SCL=$IRed
        fi
      SvnInfoColor="$SCL[SVN: $SPWD]"
    else
      SvnInfoColor=""
    fi


    # git info
    git branch >/dev/null 2>&1
    if [ $? -eq 0 ]; then
      #GitBranch=`__git_ps1 "%s"`
      git status | grep "nothing to commit" >/dev/null 2>&1
      if [ $? -eq 0 ]; then
        # Clean repository - nothing to commit
        GitInfoColor="$IGreen[git: $GitBranch]"
      else
        # Changes to working tree
        GitInfoColor="$IRed{git: $GitBranch}"
      fi
    else
      GitInfoColor=""
    fi


    export PS1="$(printf "%*s\r%s\$ " "$(tput cols)" "$(profile_info)" "$HostInfoWColor $IYellow$PathFull $SvnInfoColor$GitInfoColor") $NewLine$ $Color_Off"
  }

  profile_info() {
    local string

    if [[ -n $AWS_PROFILE ]]; then
      if [[ $AWS_PROFILE == 'support-mfa' ]]; then
        text=$(echo -e "\xf0\x9f\x90\x82\x20 \xf0\x9f\x92\x88\x20 support \xf0\x9f\x90\x82\x20 \xf0\x9f\x92\x88\x20")
        echo "$IGreen$text"
      elif [[ $AWS_PROFILE == 'grnhse-admin' ]]; then
        text=$(echo -e "\xf0\x9f\x9a\x92\x20 \xf0\x9f\x94\xa5\x20 prod!!! \xf0\x9f\x94\xa5\x20 \xf0\x9f\x9a\x92\x20")
        echo "$RED$text"
      elif [[ $AWS_PROFILE == 'personal' ]]; then
        echo "$YELLOW$AWS_PROFILE         "
      fi
    else
      L1='G'; C1="$RED"
      L2='A'; C2="$ORANGE"
      L3='Y'; C3="$YELLOW"
      L4='P'; C4="$GREEN"
      L5='R'; C5="$BLUE"
      L6='I'; C6="$PURPLE"
      L7='D'; C7="$WHITE"
      L8='E'; C8="$RED"

      # echo -e "\xf0\x9f\x8c\x88\x20 \xf0\x9f\x99\x8f\x20 $C1$L1 $C2$L2 $C3$L3 $C4$L4 $C5$L5 $C6$L6 $C7$L7 $C8$L8 \xf0\x9f\x99\x8f\x20 \xf0\x9f\x8c\x88\x20"
    fi
  }


  if echo $HOSTNAME | grep -q "^..im.*$"; then
    HostInfoWColor="$ICyan$UserName$IBlue@$ICyan$$IBlue\$(last_two_dirs) HostName";
  elif echo $HOSTNAME | grep -q "^..oq.*$"; then
    HostInfoWColor="$ICyan$UserName$IBlue@$ICyan$HostName"
  elif echo $HOSTNAME | grep -q "^..st.*$"; then
    HostInfoWColor="$IYellow$UserName$ICyan@$IYellow$HostName"
  elif echo $HOSTNAME | grep -q "^db[1|2]"; then
    HostInfoWColor="$IRed$UserName$ICyan@$IRed$HostName"
  elif echo $HOSTNAME | grep -q "home\|local\|^ip\|ec2.internal"; then
    HostInfoWColor="$RED\t$GREEN (╯°□°)╯︵ ┻━┻  $IWhite ➡ "
  else
    HostInfoWColor="$IWhite$UserName$IBlue@$IWhite$HostName"
  fi

  export PROMPT_COMMAND=soho_pwd

  if [[ $PWD == '/Users/elenawashington' ]]; then
    fortune
  fi
fi

export EDITOR=vim

export hsr="$HOME/.homesick/repos/"

# get private definitions
if [ -f ~/.bash_private ]; then
    echo 'sourcing ~/.bash_private'
    . ~/.bash_private
fi

# get work specific definitions
if [ -f ~/.bash_work_specific ]; then
    echo 'sourcing ~/.bash_work_specific'
    . ~/.bash_work_specific
fi

# get bash aliases
if [ -f ~/.bash_aliases ]; then
    echo 'sourcing ~/.bash_aliases'
    . ~/.bash_aliases
fi

# get bash functions
if [ -f ~/.bash_func ]; then
    echo 'sourcing ~/.bash_func'
    . ~/.bash_func
fi

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
    echo 'sourcing /etc/bash_completion'
    . /etc/bash_completion
fi

command -v brew > /dev/null
if [[ $? == 0 ]]; then
  echo "sourcing $(brew --prefix)/etc/bash_completion"
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

# RubyMotion
export RUBYMOTION_ANDROID_SDK=/Users/elenawashington/.rubymotion-android/sdk
export RUBYMOTION_ANDROID_NDK=/Users/elenawashington/.rubymotion-android/ndk

make_manpath

export_git_prompt () {
  command -v brew > /dev/null
  if [[ $? == 0 ]]; then
    if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
      echo "sourcing $(brew --prefix bash-git-prompt)/share/gitprompt.sh"
      GIT_PROMPT_THEME=Default
      source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
    fi
  fi
}
export_git_prompt

# gitprompt configuration
# Set config variables first
GIT_PROMPT_ONLY_IN_REPO=1

# added by travis gem
[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"

# openssl schenanigans
export LDFLAGS=-L/usr/local/opt/openssl/lib
export CPPFLAGS=-I/usr/local/opt/openssl/include
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig
export PATH="/usr/local/opt/openssl/bin:$PATH"

openssl_1_1() {
  export LDFLAGS=-L/usr/local/opt/openssl@1.1/lib
  export CPPFLAGS=-I/usr/local/opt/openssl@1.1/include
  export PKG_CONFIG_PATH=/usr/local/opt/openssl@1.1/lib/pkgconfig
  export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
}

export PATH=/usr/local/mysql/bin:$PATH
export PATH="./bin:$PATH"
export PATH=/usr/local/mysql/bin:$PATH
export PATH=/usr/local/terraform/bin:$PATH
export HOMEYPATH=~/scratch/homey/
export downloads="cd ~/Downloads"
export scratch=$HOME/scratch
export stuff=$HOME/Documents/stuff
export work=$HOME/work
export GOPATH=$scratch/go
export GOBIN=$GOPATH/bin
export PATH=$GOPATH/bin:$PATH
export PATH=/usr/local/opt/python/libexec/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(jira --completion-script-bash)"
eval "$(rbenv init -)"
