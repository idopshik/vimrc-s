" core/minigo.vim — Минимальная конфигурация для Go (быстрый старт)
" ══════════════════════════════════════════════════════════════════════════════
" Использование: export MINIGO=1 && vim file.go
" ══════════════════════════════════════════════════════════════════════════════

" Базовые настройки
set nocompatible
filetype plugin indent on
syntax enable

let mapleader = ","

" Go-специфичные настройки
set tabstop=4
set shiftwidth=4
set noexpandtab

" Минимальный UI
set number
set relativenumber
set hidden
set splitright
set splitbelow

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Encoding
set encoding=utf-8

" Минимальные плагины
call plug#begin(expand('~/.vim/plugged'))
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()

" vim-go настройки
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

" Keymaps
nnoremap <leader>r :GoRun<CR>
nnoremap <leader>b :GoBuild<CR>
nnoremap <leader>t :GoTest<CR>
nnoremap gd :GoDef<CR>
nnoremap K :GoDoc<CR>

" Window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Clear search
map <Space> :noh<CR>

echo "MINIGO mode loaded"
