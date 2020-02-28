# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)
READLINK=$(which greadlink 2>/dev/null || which readlink)
CURRENT_SCRIPT=$BASH_SOURCE
DOTFILES_DIR="$HOME/.dotfiles"

# Make utilities available
PATH="$DOTFILES_DIR/bin:$PATH"

# Source the dotfiles (order matters)

for DOTFILE in "$DOTFILES_DIR"/source/*.sh; do
	[ -f "$DOTFILE" ] && . "$DOTFILE"
done

if is-macos; then
	for DOTFILE in "$DOTFILES_DIR"/source/*.sh.macos; do
		[ -f "$DOTFILE" ] && . "$DOTFILE"
	done
fi

if is-ubuntu; then
	for DOTFILE in "$DOTFILES_DIR"/source/*.sh.ubuntu; do
		[ -f "$DOTFILE" ] && . "$DOTFILE"
	done
fi

# Hook for extra/custom stuff
DOTFILES_EXTRA_DIR="$HOME/.extra"

if [ -d "$DOTFILES_EXTRA_DIR" ]; then
	for EXTRAFILE in "$DOTFILES_EXTRA_DIR"/*.sh; do
		[ -f "$EXTRAFILE" ] && . "$EXTRAFILE"
	done
fi

# Clean up
unset READLINK CURRENT_SCRIPT DOTFILE EXTRAFILE

# Export
export DOTFILES_DIR DOTFILES_EXTRA_DIR
