"" files
set autoread
set autowrite
set cryptmethod=blowfish
set fileencoding=utf-8

"" history
set viminfo=<800,'10,/50,:100,h,f0,n~/.vim/cache/viminfo

"" backup
set nobackup
set noswapfile

"" highlighting
syntax on
colorscheme solarized
set background=dark
set hlsearch
set incsearch
set synmaxcol=800
highlight Terminal ctermbg=none

"" menu
set cmdheight=2
set laststatus=2
set statusline=%f\ (%{&ff})\ (%Y)\ [%{strftime(\"%d/%m/%y\ -\ %H:%M\")}]\ [%l,%v]\ [%p%%]\ %m%r%h
set wildmenu
set wildmode=longest,list
set wildignore=*.DS_Store
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.luac
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.orig
set wildignore+=*.pyc
set wildignore+=*.spl
set wildignore+=*.sw?
set wildignore+=.hg,.git,.svn

"" appearance
set colorcolumn=+1
set cursorline
set list
set listchars=nbsp:·
set listchars+=precedes:«
set listchars+=tab:»·
set listchars+=trail:.
set listchars+=extends:»
"set listchars+=eol:¶
set number
set ruler
set showbreak=
let &colorcolumn="79,".join(range(120,999),",")

"" behaviour
set backspace=2
set expandtab
set foldmethod=marker
set history=1000
set keywordprg=:help
set linebreak
set scrolloff=10
set secure
set notimeout
set ttimeout
set ttimeoutlen=10
set shortmess-=S
let mapleader="\<Space>"
set noshowmode

"" syntax
set autoindent
set shiftround
set shiftwidth=4
set showtabline=2
set softtabstop=4
set tabstop=4
set textwidth=78

"" mouse
set mouse=nv
set ttymouse=sgr

"" folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

"" extra
let g:perl_include_pod = 0

"" features
if has('terminal')
    packadd termdebug
endif
