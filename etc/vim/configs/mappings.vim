"" typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>

"" F keys
nnoremap <F1> :tabprev<cr>
nnoremap <F2> :tabnext<cr>
nnoremap <F3> :set hlsearch! hlsearch?<cr>
nnoremap <F4> :set paste! nopaste?<cr>
nnoremap <F5> :let &background = ( &background == "dark"? "light" : "dark" )<cr>
nnoremap <F6> :NERDTreeTabsToggle<cr>
nnoremap <F7> :TagbarToggle<cr>

"" Plugins
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
map <leader>r :NERDTreeFind<cr>

func TabTerm()
    exec "botright terminal"
    exec "resize 20"
endfu
nnoremap <expr> <leader>t TabTerm()

func TabVerTerm()
    exec "vertical botright terminal"
endfu
nnoremap <expr> <leader>v TabVerTerm()

function! TabCloseRight(bang)
    let cur=tabpagenr()
    while cur < tabpagenr('$')
        exe 'tabclose' . a:bang . ' ' . (cur + 1)
    endwhile
endfunction

function! TabCloseLeft(bang)
    while tabpagenr() > 1
        exe 'tabclose' . a:bang . ' 1'
    endwhile
endfunction

command! -bang Tabcloseright call TabCloseRight('<bang>')
command! -bang Tabcloseleft call TabCloseLeft('<bang>')
