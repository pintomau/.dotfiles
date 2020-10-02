BREW_PREFIX=$(brew --prefix)
export BASH_COMPLETION_COMPAT_DIR="$BREW_PREFIX/bash_completion.d"
[[ -r "$BREW_PREFIX/profile.d/bash_completion.sh" ]] && . "$BREW_PREFIX/profile.d/bash_completion.sh"
