# Node Version Manager

if is_osx; then

  # Exit if Homebrew is not installed.
  [[ ! "$(type -P brew)" ]] && e_error "Brew needed" && return 1

  #
  export NVM_DIR=~/.nvm
  # Load NVM into a shell
  source $(brew --prefix nvm)/nvm.sh
fi
