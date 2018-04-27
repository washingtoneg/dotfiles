#!/bin/bash

readonly THIS=$(basename "$0")

source dev_local_utils

# List of config files maintained by this script
CONFIG_FILES=(
  .bash_aliases
  .bash_func
  .bash_profile
  .bashrc
  .gitconfig
  .gitignore
  .irbrc
  .pryrc
  .tmux.conf
  .vimrc
)

options_parse() {
  local opt value

  OPTIONS="$@"

  while [[ "$#" -gt 0 ]]; do
    opt="$1"

    case "$1" in
        --debug) DEBUG=true; shift;;
        --log-dir) LOG_DIR="$2"; shift 2;;
        --no-emoji) EMOJI_SUPPORT=false; shift;;
        --use-clean-terminal) USE_CLEAN_TERM=true; shift;;
        --) shift; break;;
        *) fatal "Unknown option: $opt";;
    esac
  done

  debug "$THIS called using the $COMMAND command."
  debug "The following option string was passed: $OPTIONS"
}

setup() {
  local config

  for config in "${CONFIG_FILES[@]}"; do
    if [[ -f "~/${config}" ]]; then
      debug "${config} exists"
    else
      debug "${config} doesn't exist on your system. Symlinking..."
      : # do nothing 
    fi
  done
}

main() {
  options_parse
  setup
}

main "$@"
