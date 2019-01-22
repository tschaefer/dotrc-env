"" vundle
filetype off
set runtimepath+=$VIMVUNDLE

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'w0rp/ale.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'majutsushi/tagbar.git'
Plugin 'vim-airline/vim-airline.git'
Plugin 'vim-airline/vim-airline-themes.git'
Plugin 'tpope/vim-eunuch.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'jistr/vim-nerdtree-tabs.git'
Plugin 'vim-scripts/cscope.vim'

call vundle#end()

filetype plugin indent on

"" nerdtree
let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = [ '\~$', '.*\.pyc$', '.*\.pid$', '.*\.png$', '.*\.jpg$',
                     \ '*.jpeg$', '.*\.o$', '.*\.bak$', '.*\.la$', '.*\.so$',
                     \ 'cscope\..*', '^tags$', '^.git$' ]
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
let NERDTreeMapJumpFirstChild = 'gK'

"" airline
let g:airline_symbols_ascii = 1
let g:airline_left_sep = '>'
let g:airline_right_sep = '<'

"" ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
