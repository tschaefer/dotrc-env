"" files
set autoread
set autowrite
set cryptmethod=blowfish
set exrc
set fileencoding=utf-8

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
set showbreak=↪

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
let mapleader=","

"" syntax
set autoindent
set shiftround
set shiftwidth=4
set showtabline=2
set softtabstop=4
set tabstop=4
set textwidth=78

"" features
if has('terminal')
    packadd termdebug
endif
