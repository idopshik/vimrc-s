" ==========================================================
" core.vim — базовые настройки и keymaps
" ==========================================================

set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set number
set relativenumber
set hidden
set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan
set scrolloff=3
set sidescrolloff=5
set history=1000
set undofile
set nobackup
set nowritebackup
set noswapfile

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent

set cursorline
set showmode
set showcmd
set wildmenu
set laststatus=2
set ruler

nnoremap <SPACE> <Nop>
let mapleader=" "

" Keymaps
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>Q :q!<CR>

nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

nnoremap <leader>/ :nohlsearch<CR>
nnoremap <leader>sr :%s///g<Left><Left>

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

autocmd FileType python nnoremap <buffer> <F5> :w<CR>:!python3 %<CR>

nnoremap <leader>h :set hlsearch! hlsearch?<CR>

autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType make setlocal noexpandtab

nnoremap <leader>rv :source $MYVIMRC<CR>
nnoremap <leader>dt "=strftime("%Y-%m-%d %H:%M")<CR>P

if has("nvim")
    nnoremap <leader>tt :split term://bash<CR>
endif
