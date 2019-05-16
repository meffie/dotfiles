.PHONY: help stow unstow save dirs

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
	stow --target ~ ssh
	stow --target ~ pip

save:
	./save-files.sh \
	  ~/.bashrc \
	  ~/.gitconfig \
	  ~/.indent.pro \
	  ~/.ssh/authorized_keys \
	  ~/.ssh/config \
	  ~/.vimrc \
	  ~/.pythonrc.py \
	  ~/.taskrc

dirs:
	mkdir -p ~/.bashd
	mkdir -p ~/.ssh && chmod 700 ~/.ssh
	mkdir -p ~/.vim ~/.vim/.undo ~/.vim/.backup ~/.vim/.swap
	mkdir -p ~/.pip

unstow:
	stow -D --target ~ bash
	stow -D --target ~ git
	stow -D --target ~ vim
	stow -D --target ~ indent
	stow -D --target ~ python
	stow -D --target ~ taskwarrior
	stow -D --target ~ ssh
	stop -D --target ~ pip
