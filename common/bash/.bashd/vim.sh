# Enable vi keybinding in bash
set -o vi

export EDITOR=/usr/bin/vim
export VISUAL=vi

# af - autoformat text
# usage in vim:  :%!af
alias af='/usr/bin/perl -w -MText::Autoformat -e "autoformat {all => 1, mail => 1};"'
