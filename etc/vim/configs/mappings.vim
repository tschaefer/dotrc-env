"" Typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>

"" General
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
nnoremap <silent> <leader>o :TagbarToggle<cr>
nnoremap <silent> <leader>s :set hlsearch! hlsearch?<cr>
nnoremap <silent> <leader>p :set paste! nopaste?<cr>

"" Plugins
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
map <leader>r :NERDTreeFind<cr>

"" Terminal
function! TabTerm()
    exec "botright terminal"
    exec "resize 16"
endfunction
nnoremap <expr> <leader>t TabTerm()

function! TabVerTerm()
    exec "vertical botright terminal"
    exec "vertical resize 78"
endfunction
nnoremap <expr> <leader>v TabVerTerm()
