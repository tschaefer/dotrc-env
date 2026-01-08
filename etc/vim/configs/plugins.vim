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
" show git status in nerdtree
Plugin 'Xuyuanp/nerdtree-git-plugin'
" source browsing tool
Plugin 'vim-scripts/cscope.vim'
" version control
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
" statusbar
Plugin 'itchyny/lightline.vim'
" git diff in sign column
Plugin 'airblade/vim-gitgutter'
" code completion
Plugin 'ervandew/supertab'
" buffer only
Plugin 'vim-scripts/BufOnly.vim'
" bye buffer
Plugin 'moll/vim-bbye'
" tag file manager
Plugin 'ludovicchabant/vim-gutentags'
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
" filetype graphql
Plugin 'jparise/vim-graphql'
" gist
Plugin 'mattn/webapi-vim'
Plugin 'mattn/vim-gist'
" Ruby / Rails projects
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-rails'
" vim projects
Plugin 'tpope/vim-projectionist'
" open devdocs
Plugin 'rhysd/devdocs.vim'
" go-lang
Plugin 'fatih/vim-go'

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
    \   'left': [ [ 'rocket', 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ 'component': {
    \   'rocket': '🚀'
    \ }
    \ }

"" ale
let g:ale_linters = {
\   'perl': ['perl', 'perlcritic', 'perltidy'],
\   'python': ['flake8'],
\   'sh': ['shellcheck'],
\   'html': [],
\   'yaml': ['yamllint'],
\   'ruby': ['rubocop', 'ruby', 'solargraph'],
\ }
let g:ale_sh_shellcheck_dialect = 'bash'
let g:ale_sh_shellcheck_options = '--severity=warning'
let g:ale_virtualtext_cursor = 'disabled'
let g:ale_echo_msg_format = '[%severity%::%linter%] %s'
let g:ale_python_flake8_options = '--max-line-length=120'

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

"" git messenger
let g:git_messenger_close_on_cursor_moved = 'v:false'

"" gutentags
let g:gutentags_project_root = ['.git', '.hg', '.svn', '.bzr', '_darcs', '_FOSSIL_', '.fslckout', '.gtstop']

"" vim-go
let g:go_fmt_fail_silently = 1

"" devdocs
augroup plugin-devdocs
  autocmd!
  autocmd FileType go nmap <buffer>K <Plug>(devdocs-under-cursor)
augroup END

"" copilot
imap <silent><script><expr> <C-C> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

"" supertab
set omnifunc=ale#completion#OmniFunc
let g:SuperTabDefaultCompletionType = "context"
