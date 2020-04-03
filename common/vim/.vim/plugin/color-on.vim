" Persistently turn color on or off.

function! s:SetColorScheme(scheme)
    let l:cmd = 'colorscheme ' . a:scheme
    " The prefs file is sourced by .vimrc on startup.
    call writefile([l:cmd], $HOME . '/.vim/prefs')
    execute l:cmd
endfunction

command! ColorOn call <SID>SetColorScheme('evening')
command! ColorOff call <SID>SetColorScheme('default')
