"          '||
"           ||                    ''
"           ||''|,  '''|.  (''''  ||  .|'',
"           ||  || .|''||   `''\  ||  ||
"          .||..|' `|..||. `...' .||. `|..'



set history=1000
set undofile
set undoreload=1000
filetype plugin on
filetype indent on
set autoread
let mapleader = ","
set scrolloff=10               " let 10 lines before/after cursor during scroll
set showcmd                     " shows partial commands
set hidden                      " hide the inactive buffers
set showcmd                     " shows partial commands
set hidden                      " hide the inactive buffers
set ruler                       " sets a permanent rule
set lazyredraw                  " only redraws if it is needed
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set incsearch                   " incremental searching
set showmatch                   " show pairs match
set matchtime=3                 " было 5. Но это долго для меня
set hlsearch                    " highlight search results
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters

set wildmenu                        " Command line autocompletion
set wildmode=list:longest,full      " Shows all the options
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.jar                            " java archives
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.stats                          " Pylint stats
set wildignore=*.o,*~
syntax enable

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set textwidth=90

set autoindent              "Auto indent
set smartindent             "Smart indentt
set wrap                    "Wrap lines

set showbreak=↳                "↪ как альтернатива

""""""""""""""""""""""""""""""
"#   Lot's of other's
autocmd BufEnter * silent! :lcd%:p:h | redraw!

autocmd BufLeave,BufWinLeave * silent! mkview

set guioptions=i
set guioptions-=m               "remove menu bar
set guioptions-=T               "remove toolbar

set softtabstop=4
set laststatus=2                "always show status bar
set timeoutlen=350
set ttimeoutlen=0

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

set splitright
set splitbelow
set nocompatible                "use Vim settings, ratheset enc=utf-8
set tags=./tags,tags;$HOME
set ignorecase
set hidden

set pumheight=10
set fillchars+=vert:\
set nu
set rnu                          " rnu а значит relative number. It was three hours of my live
set belloff=all                 "desable bell
set tabstop=4                   " set tabs for a shifttabs logic
set exrc                       " enable usage of additional .vimrc files from working directory
set secure                      " prohibit .vimrc files to execute shell, create files, etc...
"
" Do not show stupid q: window
 map q: :q
 
"set keymap=russian-jcukenwin   name of the file"
set keymap=ru                  "отредактированный из Dropbox! "
set iminsert=0
set imsearch=0                   "Начинаать с латинской keemap

"=====================================================
"#    Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen

""""""""""""""""""""""""""""""
"#    Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
let &t_ut=''



