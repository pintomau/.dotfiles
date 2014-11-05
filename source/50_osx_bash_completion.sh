# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if, for some reason, Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && return 1

# bash completion from brew
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi
