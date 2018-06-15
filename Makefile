.PHONY: help install stow unstow

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
  ~/.vimrc \
  ~/.pythonrc.py \
  ~/.taskrc

install: stow

stow:
	./save-files.sh $(SAVE)
	mkdir -p ~/.ssh && chmod 700 ~/.ssh
	mkdir -p ~/.vim ~/.vim/.undo ~/.vim/.backup ~/.vim/.swap
	mkdir -p ~/.pip
	chmod 600 ssh/config
	chmod 600 ssh/authorized_keys
	stow --target ~ bash
	stow --target ~ git
	stow --target ~ vim
	stow --target ~ indent
	stow --target ~ python
	stow --target ~ tmux
	stow --target ~/.ssh ssh
	stow --target ~/.pip pip
	stow --target ~ taskwarrior

unstow:
	stow -D --target ~ bash
	stow -D --target ~ git
	stow -D --target ~ vim
	stow -D --target ~ indent
	stow -D --target ~ python
	stow -D --target ~/.ssh ssh
	stop -D --target ~/.pip pip
	stow -D --target ~ taskwarrior

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

remove: unstow
	perl -lne 'print unless /### BEGIN ###/ .. /### END ###/' /etc/hosts >hosts/hosts
	sudo cp hosts/hosts /etc/hosts
	rm -f hosts/hosts
	rm -rf keys

clean:
	rm -rf hosts/hosts
