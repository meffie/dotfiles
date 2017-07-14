.PHONY: help install links keys hosts

KEYS=mmeffie@scp.sinenomine.net:/afs/sinenomine.net/user/mmeffie/private/ssh/*
SAVE=\
~/.bash_aliases \
~/.bashrc \
~/bin \
~/.gitconfig \
~/.indent.pro \
~/.ssh/authorized_keys \
~/.ssh/config \
~/.vimrc

help:
	@echo "usage: make <target>"
	@echo "targets:"
	@echo "  install - all (requires sudo and ssh password)"
	@echo "  links   - install links for configs and scripts"
	@echo "  keys    - download public and private keys (requires ssh password)"
	@echo "  hosts   - update /etc/hosts (requires sudo)"
	@echo "  help    - show targets"

install: links keys hosts

links:
	./save-files.sh $(SAVE)
	mkdir -p ~/.ssh && chmod 700 ~/.ssh
	stow --target ~ bash
	stow --target ~ git
	stow --target ~ vim
	stow --target ~ indent
	stow --target ~ scripts
	stow --target ~/.ssh ssh

keys:
	mkdir -p ~/.ssh && chmod 700 ~/.ssh
	scp $(KEYS) ~/.ssh

hosts:
	(cd hosts && ./genhosts.sh > hosts)
	sudo cp hosts/hosts /etc/hosts
	@rm -f hosts/hosts
