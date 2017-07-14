.PHONY: help install remove link links keys hosts

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
	@echo "main targets:"
	@echo "  install - install everything"
	@echo "  remove  - remove (just links)"
	@echo "other targets:"
	@echo "  links   - create symlinks to configs and scripts"
	@echo "  keys    - download public and private keys (requires ssh password)"
	@echo "  hosts   - update /etc/hosts (requires sudo)"
	@echo "  help    - show targets"

install: links keys hosts

link: links # alias
links:
	./save-files.sh $(SAVE)
	mkdir -p ~/.ssh && chmod 700 ~/.ssh
	stow --target ~ bash
	stow --target ~ git
	stow --target ~ vim
	stow --target ~ indent
	stow --target ~ scripts
	stow --target ~/.ssh ssh

remove:
	stow -D --target ~ bash
	stow -D --target ~ git
	stow -D --target ~ vim
	stow -D --target ~ indent
	stow -D --target ~ scripts
	stow -D --target ~/.ssh ssh
	# todo: cleanup hosts and keys?

keys:
	mkdir -p ~/.ssh && chmod 700 ~/.ssh
	scp $(KEYS) ~/.ssh

hosts:
	(cd hosts && ./genhosts.sh > hosts)
	sudo cp hosts/hosts /etc/hosts
	@rm -f hosts/hosts
