" -- General behavior --
set nocompatible    " Be vim instead of vi.
set hidden          " Disable 'no write since last change' error when changing buffers.
set number          " enable line numbering
syntax on           " enable syntax highlighting

" -- Appearance --
colorscheme evening " Just a preference
set hlsearch        " Highlight the last search results.
set colorcolumn=80

" -- Whitespace --
set tabstop=4       " Number of visual spaces per TAB.
set softtabstop=4   " Number of spaces in tab when editing.
set expandtab       " Expand tab-key to space chars.
filetype plugin on  " Enable ~/.vim/ftplugins/*.vim plugins to
                    " override tab and indent settings by language.
" -- Temporary files --
" The following set the paths for backup, undo, and swp files
" create vim to avoid littering the current directory with these
" tmp files.
set undodir=~/.vim/.undo,.
set backupdir=~/.vim/.backup,.,~/tmp,~/
set directory=~/.vim/.swap,.,~/tmp,/var/tmp,/tmp

if filereadable($HOME.'/.vim/prefs')
    source $HOME/.vim/prefs
endif
