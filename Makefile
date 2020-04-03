.PHONY: all install uninstall stow unstow save dirs

HOSTNAME=$(shell uname -n)
PACKAGES=ansible bash git indent pip python taskwarrior tmux vim virt-lab
DIRS=.bashd .ssh .vim .vim/.undo .vim/.backup .vim/.swap .pip .virt-lab
FILES=.bashrc .gitconfig .indent.pro .pythonrc.py .taskrc .vimrc

install: stow
uninstall: unstow

stow:
	/bin/bash save-files.sh $(FILES)
	@for dir in $(DIRS); do \
	    if [ ! -d $(HOME)/$$dir ]; then \
	        echo making directory $(HOME)/$$dir; \
	        mkdir -p $(HOME)/$$dir; \
	    fi; \
	done
	@for package in $(PACKAGES); do \
	    echo stowing $$package; \
	    stow --target=$(HOME) $$package; \
	done
	@if [ -d host-specific/$(HOSTNAME) ]; then \
	    echo stowing kvm-install-vm; \
	    stow --target=$(HOME) --dir=host-specific/$(HOSTNAME) kvm-install-vm; \
	fi
	@echo Setup ssh configuration
	if [ ! -f ~/.ssh/config ]; then \
	    cp ssh/.ssh/config $(HOME)/.ssh/config; \
	fi
	chmod 700 $(HOME)/.ssh
	chmod 600 $(HOME)/.ssh/config

unstow:
	@for package in $(PACKAGES); do \
	    echo unstowing $$package; \
	    stow -D --target=$(HOME) $$package; \
	done
	@if [ -d host-specific/$(HOSTNAME) ]; then \
	    echo unstowing kvm-install-vm; \
	    stow -D --target=$(HOME) --dir=host-specific/$(HOSTNAME) kvm-install-vm; \
	fi
