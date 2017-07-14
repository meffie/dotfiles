"
" Show/Hide tabs characters. Handy for code bases which mix tabs and
" spaces (yuck) or showing spurious tabs in python.
"
" usage:
"
"   :ShowTabs
"   :HideTabs
"

function! ShowTabsFn()
    set list
    set listchars=tab:>-
endfunction

function! HideTabsFn()
    set nolist
endfunction

command! ShowTabs call ShowTabsFn()
command! HideTabs call HideTabsFn()
