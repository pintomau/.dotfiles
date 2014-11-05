# Node Version Manager

if is_osx; then

  # Exit if Homebrew is not installed.
  [[ ! "$(type -P brew)" ]] && e_error "Brew casks need Homebrew to install." && return 1

  # Load NVM into a shell
  source $(brew --prefix nvm)/nvm.sh
  #
  export NVM_DIR=~/.nvm
fi
