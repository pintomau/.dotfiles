SHELL := /bin/bash
DOTFILES_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

# on linux, brew is installed in one of these paths
LINUX_BREW_SUDO := /home/linuxbrew/.linuxbrew/bin/
LINUX_BREW_NON_SUDO := $(HOME)/.linuxbrew/bin

PATH := $(LINUX_BREW_SUDO):$(LINUX_BREW_NON_SUDO):$(DOTFILES_DIR)/bin:$(PATH)
NVM_DIR := $(HOME)/.nvm
OS := $(shell bin/is-supported bin/is-macos macos linux)
export XDG_CONFIG_HOME := $(HOME)/.config
export STOW_DIR := $(DOTFILES_DIR)

.PHONY: test

all: sudo brew packages link

sudo:
	sudo -v
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

packages: brew-packages

stow: brew
	is-executable stow || brew install stow

# http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
link: stow
	for FILE in $$(\ls -A link); do if [ -f $(HOME)/$$FILE -a ! -h $(HOME)/$$FILE ]; then mv -v $(HOME)/$$FILE{,.bak}; fi; done
	mkdir -p $(XDG_CONFIG_HOME)
	stow -t $(HOME) link
	stow -t $(XDG_CONFIG_HOME) config

unlink: stow
	stow --delete -t $(HOME) link
	stow --delete -t $(XDG_CONFIG_HOME) config
	for FILE in $$(\ls -A link); do if [ -f $(HOME)/$$FILE.bak ]; then mv -v $(HOME)/$$FILE.bak $(HOME)/$${FILE%%.bak}; fi; done

brew:
	is-executable brew || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew-packages: brew
	brew bundle --file=$(DOTFILES_DIR)/install/Brewfile
