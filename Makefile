.PHONY: all install uninstall stow unstow ssh-config

HOSTNAME=$(shell uname -n)
PACKAGES=ansible bash git indent kvm-install-vm pip python taskwarrior \
         tmux vim virt-lab
FILES=.bashrc .gitconfig .indent.pro .pythonrc.py .taskrc .vimrc
DIRS=.bashd .ssh .vim .vim/.undo .vim/.backup .vim/.swap .pip .virt-lab

install: stow
uninstall: unstow

stow: ssh-config
	/bin/bash save-files.sh $(FILES)
	@for dir in $(DIRS); do \
	  if [ ! -d $(HOME)/$$dir ]; then \
	    echo making directory $(HOME)/$$dir; \
	    mkdir -p $(HOME)/$$dir; \
	  fi; \
	done
	@for package in $(PACKAGES); do \
	  for dir in common hosts/$(HOSTNAME); do \
	    if [ -d $$dir/$$package ]; then \
	      echo stowing $$package; \
	      stow --target=$(HOME) --dir=$$dir $$package; \
	    fi; \
	  done; \
	done

unstow:
	@for package in $(PACKAGES); do \
	  for dir in common hosts/$(HOSTNAME); do \
	    if [ -d $$dir/$$package ]; then \
	      echo unstowing $$package; \
	      stow -D --target=$(HOME) --dir=$$dir $$package; \
	    fi; \
	  done; \
	done

ssh-config:
	@echo Setup ssh configuration
	@if [ ! -f $(HOME)/.ssh/config ]; then \
	    echo copying ssh/.$(HOME)/.ssh/config to $(HOME)/.ssh \
	    cp ssh/.ssh/config $(HOME)/.ssh/config; \
	fi
	chmod 700 $(HOME)/.ssh
	chmod 600 $(HOME)/.ssh/config
