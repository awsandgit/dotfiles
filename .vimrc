"  ____  ____  
" |  _ \/ ___|   
" | |_) \___ \   Author: Rohit   
" |  _ < ___) |  Script: ~/.vimrc
" |_| \_\____/   License: MIT License 
"
"
source /usr/share/doc/fzf/examples/fzf.vim
set backspace=indent,eol,start 

let mapleader=" "
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
"nnoremap <space> za

Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'ap/vim-css-color'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'dracula/vim', { 'name': 'dracula' }

"-------------done by me-------------------
set hlsearch
set incsearch
set showcmd

"set clipboard=unnamedplus
"vnoremap <C-c> "+y
"map <C-p> "+P

"For clipboard
vmap <C-c> :!xclip -f -sel clip<CR>

set tabstop=4
set softtabstop=4
set shiftwidth=4

set autoindent
set expandtab
set fileformat=unix

let python_highlight_all=1
syntax on
set encoding=utf-8
set number relativenumber

" press Ctrl+n for autocomplete
set wildmode=longest,list,full

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"" Splits
set splitbelow splitright

"REMAPS

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"vertical movements
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

"for search
nnoremap n nzzzv
nnoremap N Nzzzv

"move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"alias S as %s//g
nnoremap S :%s//g<Left><Left> 

"newtab
nnoremap <silent> <C-t> :tabnew<CR>

au BufRead,BufNewFile *.js, *.html, *.css, *.yml, *.yaml
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
