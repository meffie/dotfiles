colorscheme evening
set modeline
set hlsearch
set nu
set splitright

set nocompatible
filetype plugin on
syntax on
nnoremap ; :

if has("xxx_multi_byte")
    " show tabs as arrow glyphs
    set list
    set listchars=tab:\►\ 
endif

" c
au BufNewFile,BufRead *.[ch] set noexpandtab
" python
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set tabstop=4
" md (markdown)
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdwn set filetype=markdown


" folding settings
"set foldmethod=indent   "fold based on indent
"set foldnestmax=10      "deepest fold is 10 levels
"set nofoldenable        "dont fold by default
set foldlevel=99         "unfold everything

" shell settings
"set makeprg=make\ myobj.o
