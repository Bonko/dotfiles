"vim config
"https://github.com/klen/python-mode:
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on

set background=dark

set shiftwidth=4
set tabstop=4
set backspace=indent,eol,start
set ls=2

set ruler
set hlsearch
set incsearch
set ignorecase
set smartcase
set showcmd
set binary noeol

set noautoindent
set nosmartindent
set nocompatible
set expandtab
set nowrap
set eol

"filetype plugin on

" omni completion
set ofu=syntaxcomplete#Complete

let g:pymode_folding = 0
let g:pymode_lint_checker = "pep8"
" disable line length check
let g:pymode_lint_ignore = "E501"
let g:pymode_options_colorcolumn = 0
let g:pymode_rope=0

autocmd FileType ruby setlocal sw=2 sts=2 et tw=72
autocmd FileType eruby setlocal sw=2 sts=2 et
autocmd FileType puppet setlocal sw=2 sts=2 iskeyword+=:,-
autocmd FileType json set sw=2 sts=2
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType yaml setlocal sw=2 sts=2 et

highlight ExtraWhitespace ctermbg=darkred
"highlight MixedWhitespace ctermbg=darkred
match ExtraWhitespace /\s\+$/
"match MixedWhitespace /^ \+\t/
let mapleader=","

"no 80 chars and documentation check for puppet-lint
let g:syntastic_puppet_puppetlint_args = '--no-80chars-check --no-documentation-check'

set nofoldenable

" grep with F6
set grepprg=ag
nmap <F6> :silent grep <C-R><C-W><CR><C-L>
vmap <F6> "gy<ESC>:silent grep '<C-R>g'<CR><C-L>
" Ctrl-Left previous error/match
nmap <C-Left> :cp<CR>
" " Ctrl-Right next error/match
nmap <C-Right> :cn<CR>

" Go highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" run goimports on save
let g:go_fmt_command = "goimports"
" run program with ,r
autocmd FileType go nmap <leader>r  <Plug>(go-run)

