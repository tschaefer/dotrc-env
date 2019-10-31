"" vundle
filetype off
set runtimepath+=$VIMVUNDLE

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'w0rp/ale.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'majutsushi/tagbar.git'
Plugin 'tpope/vim-eunuch.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'jistr/vim-nerdtree-tabs.git'
Plugin 'vim-scripts/cscope.vim'
Plugin 'juneedahamed/vc.vim.git'
Plugin 'itchyny/lightline.vim.git'
Plugin 'tpope/vim-surround.git'

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

"" lightline
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
    \ }
