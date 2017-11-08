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
nnoremap <F1>  :tabprev<cr>
nnoremap <F2>  :tabnext<cr>
nnoremap <F3>  :set hlsearch! hlsearch?<cr>
nnoremap <F4>  :set paste! nopaste?<cr>
nnoremap <F5>  :let &background = ( &background == "dark"? "light" : "dark" )<cr>
nnoremap <F11> :NERDTreeTabsOpen<cr>
nnoremap <F12> :NERDTreeTabsClose<cr>
