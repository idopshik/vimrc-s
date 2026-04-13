" core/options.vim — Базовые настройки (set-опции)
" ══════════════════════════════════════════════════════════════════════════════
"
"          '||
"           ||                    ''
"           ||''|,  '''|.  (''''  ||  .|'',
"           ||  || .|''||   `''\  ||  ||
"          .||..|' `|..||. `...' .||. `|..'
"
" ══════════════════════════════════════════════════════════════════════════════

" === General ===
filetype plugin on
filetype indent on
syntax enable

let mapleader = ","
let maplocalleader = "\<Space>"

set timeoutlen=350
set ttimeoutlen=0

" === Search ===
set incsearch                   " incremental searching
set showmatch                   " show pairs match
set matchtime=3                 " tenths of a second to show match
set hlsearch                    " highlight search results
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters

" === Windows/Splits ===
set splitright
set splitbelow

" === Compatibility ===
set nocompatible

" === Tags ===
set tags=./tags,tags;$HOME

" === Buffers ===
set hidden                      " allow hidden buffers

" === UI ===
set pumheight=10                " popup menu height
set fillchars+=vert:\           " vertical split character
set relativenumber              " relative line numbers
set number                      " current line number
set belloff=all                 " disable bell
set secure                      " prohibit .vimrc to execute shell
set cursorline                  " highlight current line

" === Encoding ===
set encoding=utf-8
set fileencoding=utf-8

" === По умолчанию: no backup/swap/undo (переопределяется в platform/*.vim) ===
set nobackup
set noswapfile
set noundofile

" === 'C-U in insert mode deletes unreversible' problem solving ===
" После удаления: Ctrl-R " восстановит
inoremap <silent> <C-W> <C-\><C-O>db
inoremap <silent> <C-U> <C-\><C-O>d0

" === Indentation ===
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" === Wrapping ===
set nowrap
set linebreak
set showbreak=↪\ 

" === Wildmenu ===
set wildmenu
set wildmode=longest:full,full
set wildignore+=*.pyc,*.o,*.obj,*.swp,*.class,*.DS_Store,*.min.*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/__pycache__/*,*/venv/*

" === Scrolling ===
set scrolloff=5
set sidescrolloff=10

" === Backspace ===
set backspace=indent,eol,start

" === Mouse (optional, works in terminal too) ===
if has('mouse')
    set mouse=a
endif

" === Clipboard (system clipboard integration) ===
if has('clipboard')
    " раздражает, что когда удаляю - портится то, что я держал в буфере и
    " собирался вставить. 
    if has('unnamedplus')
        " set clipboard=unnamedplus
    else
        " set clipboard=unnamed
    endif
endif

" === Performance ===
set lazyredraw                  " don't redraw while executing macros
set updatetime=300              " faster completion
set timeoutlen=500              " time to wait for mapped sequence

" === History ===
set history=1000

" === Neovim-specific ===
if has('nvim')
    set inccommand=nosplit      " live substitution preview
endif

" === GUI-specific (применится если gui_running) ===
if has('gui_running')
    set guioptions-=m           " remove menu bar
    set guioptions-=T           " remove toolbar
    set guioptions-=r           " remove right scrollbar
    set guioptions-=L           " remove left scrollbar
endif
