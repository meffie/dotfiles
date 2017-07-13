.PHONY: help install config keys hosts clean

KEYS=mmeffie@scp.sinenomine.net:/afs/sinenomine.net/user/mmeffie/private/ssh/*

help:
	@echo "usage: make <target>"
	@echo "targets:"
	@echo "  install - install links, update keys and hosts"
	@echo "  config  - install links for config files"
	@echo "  keys    - download public and private keys (requires password)"
	@echo "  hosts   - update /etc/hosts (requires sudo)"
	@echo "  help    - show targets"
	@echo "  clean   - remove generated files"

install: config keys hosts

config:
	./save-files.sh ~/.bashrc ~/.gitconfig ~/.vimrc ~/.indent.pro \
	                ~/.ssh/authorized_keys ~/.ssh/config
	mkdir -p ~/.ssh && chmod 700 ~/.ssh
	stow --stow --target ~ bash
	stow --stow --target ~ git
	stow --stow --target ~ vim
	stow --stow --target ~ indent
	stow --stow --target ~/.ssh ssh

keys:
	mkdir -p ~/.ssh && chmod 700 ~/.ssh
	scp $(KEYS) ~/.ssh

hosts:
	(cd hosts && ./genhosts.sh > hosts)
	sudo cp hosts/hosts /etc/hosts

clean:
	rm -f hosts/hosts
