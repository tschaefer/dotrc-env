"" vundle
filetype off
set runtimepath+=$VIMVUNDLE

call vundle#begin()

" plugin manager
Plugin 'VundleVim/Vundle.vim'
" syntax checker and linter
Plugin 'w0rp/ale'
" outline viewer
Plugin 'majutsushi/tagbar'
" unix comands
Plugin 'tpope/vim-eunuch'
" file system explorer
Plugin 'scrooloose/nerdtree'
" show nerdtree in all tabs
Plugin 'jistr/vim-nerdtree-tabs'
" source browsing tool
Plugin 'vim-scripts/cscope.vim'
" version control
Plugin 'tpope/vim-fugitive'
" statusbar
Plugin 'itchyny/lightline.vim'
" quote signs
Plugin 'tpope/vim-surround'
" git diff in sign column
Plugin 'airblade/vim-gitgutter'
" ack for vim
Plugin 'mileszs/ack.vim'
" code completion
Plugin 'ervandew/supertab'
" buffer only
Plugin 'vim-scripts/BufOnly.vim'
" vue js
Plugin 'posva/vim-vue'
" no distraction
Plugin 'junegunn/goyo.vim'
" bye buffer
Plugin 'moll/vim-bbye'
" comment stuff out
Plugin 'tpope/vim-commentary'

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
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }

"" ale
let g:ale_linters = {
\   'perl': ['perl', 'perlcritic'],
\ }

"" tagbar
let g:tagbar_width = max([25, winwidth(0) / 5])
let g:tagbar_type_perl = {
    \ 'ctagstype'   : 'Perl',
    \ 'kinds' : [
        \ 'p:packages',
        \ 'u:uses',
        \ 'e:extends',
        \ 'w:roles',
        \ 'c:constants',
        \ 'h:attributes',
        \ 'x:modifiers',
        \ 's:subroutines',
    \ ],
\ }

"" supertab
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<s-nul>'
