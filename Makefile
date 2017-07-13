.PHONY: help install config keys hosts clean

KEYS=mmeffie@scp.sinenomine.net:/afs/sinenomine.net/user/mmeffie/private/ssh/*

help:
	@echo "usage: make <target>"
	@echo "targets:"
	@echo "install - install all"
	@echo "config  - install config file links"
	@echo "keys    - install ssh keys"
	@echo "hosts   - update global /etc/hosts (uses sudo)"
	@echo "clean   - remove generated files"

install: config keys hosts

config:
	test -f ~/.bashrc && mv ~/.bashrc ~/.bashrc.save
	stow --stow --target ~ bash
	stow --stow --target ~ git
	stow --stow --target ~ vim
	mkdir -p ~/.ssh
	chmod 700 ~/.ssh
	stow --stow --target ~/.ssh ssh

keys:
	mkdir -p ~/.ssh
	chmod 700 ~/.ssh
	scp $(KEYS) ~/.ssh

hosts:
	(cd hosts && ./genhosts.sh > hosts)
	sudo cp hosts/hosts /etc/hosts

clean:
	rm -f hosts/hosts
