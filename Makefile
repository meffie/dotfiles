.PHONY: install remove

help:
	@echo "usage: make <target>"
	@echo "where <target> is one of:"
	@echo "  install - install the symlinks"
	@echo "  remove - remove the symlinks"

install:
	stow bash git vim

remove:
	stow -D bash git vim
