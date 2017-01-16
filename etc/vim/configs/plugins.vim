"" vundle
filetype off
set runtimepath+=$VIMVUNDLE

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'davidhalter/jedi-vim.git'
Plugin 'majutsushi/tagbar.git'
Plugin 'vim-airline/vim-airline.git'
Plugin 'vim-airline/vim-airline-themes.git'
Plugin 'tpope/vim-eunuch.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'jistr/vim-nerdtree-tabs.git'
Plugin 'vim-scripts/cscope.vim'

call vundle#end()

filetype plugin indent on

"" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_enable_signs = 1
let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'
let g:syntastic_disabled_filetypes = ['html', 'rst']
let g:syntastic_perl_checkers = ['perl']
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_lib_path = ['./lib']

"" nerdtree
let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$',
                     \ 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py',
                     \ '.*-fixtures-.*.json', '.*\.o$', 'db.db', 'tags.bak']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
let NERDTreeMapJumpFirstChild = 'gK'
