
"          '||
"           ||                    ''
"           ||''|,  '''|.  (''''  ||  .|'',
"           ||  || .|''||   `''\  ||  ||
"          .||..|' `|..||. `...' .||. `|..'
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Neovim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:python3_host_prog = "C:\\Users\\belousov\\AppData\\Local\\Programs\\Python\\Python312"

" let g:python3_host_prog='C:/Users/belousov/Documents/PyScripts/Envs/neovim4/Scripts/python'
let  g:python3_host_prog = 'C:/Users/belousov/Documents/PyScripts/Envs/neovim3/Scripts/python.exe'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nomodeline


filetype plugin on
filetype indent on
syntax enable

let mapleader = ","
let maplocalleader = "\<Space>"

set timeoutlen=350
set ttimeoutlen=0
"====================================================
"" Search
"=====================================================
set incsearch                   " incremental searching
set showmatch                   " show pairs match
set matchtime=3                 " было 5. Но это долго для меня
set hlsearch                    " highlight search results
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters

set splitright
set splitbelow
set nocompatible                "use Vim settings, ratheset enc=utf-8
set tags=./tags,tags;$HOME
set hidden

set pumheight=10
set fillchars+=vert:\
set rnu                          "relative number. It was three hours of my live
set nu                           "number. current's line nummer
set belloff=all                  "desable bell
set secure                       "prohibit .vimrc files to execute shell, create files, etc...

set encoding=utf-8              " The encoding displayed.
set fileencoding=utf-8          " The encoding written to file.

set formatoptions-=cro        " disable continuation of comments to the next line

"====================================================
" Dot't leave lot's of clutter after yourself
"=====================================================
" подкл. далее extended переопределяет это всё наоборот.
set nobackup                    "don't make backups if sudo"
set noswapfile                  "don't make swapfile if sudo"
set noundofile                  "don't make undofile if sudo"

"====================================================
" 'C-U in insert mode deletes unreversible' problem solving
"=====================================================
" Сразу после удаления делаешь ctrl-R двойная кавычка. (регистр) 
inoremap <silent> <C-W> <C-\><C-O>db
inoremap <silent> <C-U> <C-\><C-O>d0
