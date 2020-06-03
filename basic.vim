
"          '||
"           ||                    ''
"           ||''|,  '''|.  (''''  ||  .|'',
"           ||  || .|''||   `''\  ||  ||
"          .||..|' `|..||. `...' .||. `|..'
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


filetype plugin on
filetype indent on
syntax enable

let mapleader = ","
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

"====================================================
"" Dot't leave lot's of something after yourself
"=====================================================
" подкл. далее extended переопределяет это всё наоборот.
set nobackup                    "don't make backups if sudo"
set noswapfile                  "don't make swapfile if sudo"
set noundofile                  "don't make undofile if sudo"
