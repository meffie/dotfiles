.PHONY: install remove bash git vim

include config

all: install

help:
	@echo "usage: make <target>"
	@echo "where <target> is one of:"
	@echo "  install"
	@echo "  remove"
	@echo "  bash"
	@echo "  git"
	@echo "  vim"

install: bash git vim
bash:
	stow bash
git:
	stow git
vim:
	stow $(VIM)

remove:
	stow -D bash
	stow -D git
	stow -D $(VIM)
