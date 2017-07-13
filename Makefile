.PHONY: install config keys

KEYS=mmeffie@scp.sinenomine.net:/afs/sinenomine.net/user/mmeffie/private/ssh/*

install: config keys

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
