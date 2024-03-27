"" vundle
filetype off
set runtimepath+=${HOME}/.vim/bundle/Vundle.vim

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
Plugin 'tpope/vim-rhubarb'
" statusbar
Plugin 'itchyny/lightline.vim'
" git diff in sign column
Plugin 'airblade/vim-gitgutter'
" ack for vim
Plugin 'mileszs/ack.vim'
" code completion
Plugin 'ervandew/supertab'
" buffer only
Plugin 'vim-scripts/BufOnly.vim'
" no distraction
Plugin 'junegunn/goyo.vim'
" bye buffer
Plugin 'moll/vim-bbye'
" tag file manager
Plugin 'ludovicchabant/vim-gutentags'
" markdown preview
Plugin 'skanehira/preview-markdown.vim'
" git messages
Plugin 'rhysd/git-messenger.vim'
" ruby rspec
Plugin 'thoughtbot/vim-rspec'
" trim trailing whitespace
Plugin 'csexton/trailertrash.vim'
" fuzzy search
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" Github CoPilot
Plugin 'github/copilot.vim'
" Coffeescript
Plugin 'kchmck/vim-coffee-script'
" GraphQL
Plugin 'jparise/vim-graphql'

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
let NERDTreeWinSize = 30

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
\   'perl': ['perl', 'perlcritic', 'perltidy'],
\   'python': ['flake8'],
\   'sh': ['shellcheck'],
\   'html': [],
\ }
let g:ale_sh_shellcheck_dialect = 'bash'
let g:ale_sh_shellcheck_options = '--severity=warning'
let g:ale_virtualtext_cursor = 'disabled'
let g:ale_echo_msg_format = '[%severity%::%linter%] %s'

"" tagbar
let g:tagbar_width = 36
let g:tagbar_show_tag_linenumbers = 1
let g:tagbar_type_perl = {
    \ 'ctagstype'   : 'Perl',
    \ 'kinds' : [
        \ 'p:packages',
        \ 'u:uses',
        \ 'e:extends',
        \ 'r:roles',
        \ 'n:read-only',
        \ 'g:globals',
        \ 'h:attributes',
        \ 'x:modifiers',
        \ 's:subroutines',
        \ 'o:POD',
    \ ],
\ }

"" supertab
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<s-nul>'

"" git messenger
let g:git_messenger_close_on_cursor_moved = 'v:false'

"" ruby rspec
map <Leader>r :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>f :call RunNextFailure()<CR>

"" markdown preview
let g:preview_markdown_auto_update = 1

"" gutentags
let g:gutentags_project_root = ['.git', '.hg', '.svn', '.bzr', '_darcs', '_FOSSIL_', '.fslckout', '.gtstop']
