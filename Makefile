.PHONY: help install remove link unlink

KEYS=\
  mmeffie@scp.sinenomine.net:/afs/sinenomine.net/user/mmeffie/private/ssh/*
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
	@echo "  install - install links"
	@echo "  remove  - remove links"

install: link /etc/hosts

link: keys
	./save-files.sh $(SAVE)
	mkdir -p ~/.ssh && chmod 700 ~/.ssh
	mkdir -p ~/.vim ~/.vim/.undo ~/.vim/.backup ~/.vim/.swap
	stow --target ~ bash
	stow --target ~ git
	stow --target ~ vim
	stow --target ~ indent
	stow --target ~ scripts
	stow --target ~/.ssh ssh
	stow --target ~/.ssh keys

unlink:
	stow -D --target ~ bash
	stow -D --target ~ git
	stow -D --target ~ vim
	stow -D --target ~ indent
	stow -D --target ~ scripts
	stow -D --target ~/.ssh ssh
	stow -D --target ~/.ssh keys

keys:
	mkdir -p keys
	scp $(KEYS) keys/

hosts/hosts: hosts/hosts.d/*
	perl -lne 'print unless /### BEGIN ###/ .. /### END ###/' /etc/hosts >hosts/hosts
	echo '### BEGIN ###' >>hosts/hosts
	cat hosts/hosts.d/* >>hosts/hosts
	echo '### END ###' >>hosts/hosts

/etc/hosts: hosts/hosts
	sudo cp hosts/hosts /etc/hosts

remove: unlink
	perl -lne 'print unless /### BEGIN ###/ .. /### END ###/' /etc/hosts >hosts/hosts
	sudo cp hosts/hosts /etc/hosts
	rm -f hosts/hosts
	rm -rf keys
