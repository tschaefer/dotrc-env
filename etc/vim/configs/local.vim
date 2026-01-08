let s:rc  = getcwd() . '/.local.vim'
let s:sig = getcwd() . '/.local.vim.asc'

if !filereadable(s:rc)
    finish
endif

if !filereadable(s:sig)
    echohl WarningMsg
    echom "Warning: Signature file .local.vim.asc not found!"
    echohl None
    finish
endif

let null = system('gpg --verify ' . s:sig . ' ' . s:rc)
if v:shell_error != 0
    echohl ErrorMsg
    echom "Error: Signature verification failed for .local.vim!"
    echohl None
    finish
endif

exe 'source' s:rc
