.PHONY: install

SSH=~/.ssh
KEYS=scp.sinenomine.net:/afs/sinenomine.net/user/mmeffie/private/ssh/*

install:
	stow --stow --target ~ bash
	stow --stow --target ~ git
	stow --stow --target ~ vim
	mkdir -p $(SSH)
	chmod 700 $(SSH)
	stow --stow --target $(SSH) ssh
	@scp $(KEYS) $(SSH)
