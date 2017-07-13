.PHONY: install

KEYS=mmeffie@scp.sinenomine.net:/afs/sinenomine.net/user/mmeffie/private/ssh/*

install:
	test -f ~/.bashrc && mv ~/.bashrc ~/.bashrc.save
	stow --stow --target ~ bash
	stow --stow --target ~ git
	stow --stow --target ~ vim
	mkdir -p ~/.ssh
	chmod 700 ~/.ssh
	stow --stow --target ~/.ssh ssh
	scp $(KEYS) ~/.ssh
