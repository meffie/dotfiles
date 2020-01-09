.PHONY: help stow unstow save dirs
HOSTNAME=$(shell uname -n)

all: stow
install: stow
uninstall: unstow

stow: save dirs
	stow --target ~ bash
	stow --target ~ git
	stow --target ~ vim
	stow --target ~ indent
	stow --target ~ python
	stow --target ~ tmux
	stow --target ~ taskwarrior
	stow --target ~ pip
	stow --target ~ virt-lab
	test -d host-specific/$(HOSTNAME) && cd host-specific/$(HOSTNAME) && stow --target ~ virt-lab
	test -f ~/.ssh/config || cp ssh/.ssh/config ~/.ssh/config && chmod 600 ~/.ssh/config

save:
	./save-files.sh \
	  ~/.bashrc \
	  ~/.gitconfig \
	  ~/.indent.pro \
	  ~/.vimrc \
	  ~/.pythonrc.py \
	  ~/.taskrc

dirs:
	mkdir -p ~/.bashd
	mkdir -p ~/.ssh && chmod 700 ~/.ssh
	mkdir -p ~/.vim ~/.vim/.undo ~/.vim/.backup ~/.vim/.swap
	mkdir -p ~/.pip
	mkdir -p ~/.virt-lab

unstow:
	stow -D --target ~ bash
	stow -D --target ~ git
	stow -D --target ~ vim
	stow -D --target ~ indent
	stow -D --target ~ python
	stow -D --target ~ taskwarrior
	stop -D --target ~ pip
