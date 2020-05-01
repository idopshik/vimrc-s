"          '||
"           ||                    ''
"           ||''|,  '''|.  (''''  ||  .|'',
"           ||  || .|''||   `''\  ||  ||
"          .||..|' `|..||. `...' .||. `|..'
"

" ALWAYS clear the folder .vim/view to accept changes.

"#    Windows options here

if has("win32")
        "Убираем крякозябры из-за CP-1251 Windows. Работает только в начале файла
    set langmenu=en_US.UTF-8    " sets the language of the menu (gvim)
        language en                 " sets the language of the messages / ui (vim)
        " Specific machine's file system related path's:
    " set encoding=utf-8      "Got strange symbols in meny w/o that
    " set termencoding=utf-8

    "language en_US.utf8
    :let &pythonthreehome = 'C:\progs\Python37\'

    :let &pythonthreedll = 'C:\progs\Python37\python37.dll'

    :let &pythonhome = 'C:\progs\Python27\'
    :let &pythondll = 'C:\progs\Python27\python27.dll'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't show mode in cmd window - doesn't work.:w
set noshowmode          

"can be overridden be extended fiel"
set history=1000
set undofile
set undoreload=1000

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving - только мешает
" nmap <leader>w :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=10               " let 10 lines before/after cursor during scroll

" Avoid garbled characters in Chinese language windows OS
if has("win32")
        "Убираем крякозябры из-за CP-1251 Windows. Работает только в начале файла
        set langmenu=en_US.UTF-8    " sets the language of the menu (gvim)
        language en                 " sets the language of the messages / ui (vim)
endif

set showcmd                     " shows partial commands
set hidden                      " hide the inactive buffers
set showcmd                     " shows partial commands
set hidden                      " hide the inactive buffers
set ruler                       " sets a permanent rule
set lazyredraw                  " only redraws if it is needed

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"====================================================
"" Search settings
"=====================================================
set incsearch                   " incremental searching
set showmatch                   " show pairs match
set matchtime=3                 " было 5. Но это долго для меня
set hlsearch                    " highlight search results
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters

" Wildmenu {{{

set wildmenu                        " Command line autocompletion
set wildmode=list:longest,full      " Shows all the options

set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.jar                            " java archives
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.stats                          " Pylint stats
set wildignore=*.o,*~

" Ignore compiled files
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
" }}}

" Enable syntax highlighting
syntax enable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"#   Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 90 characters
set lbr
set textwidth=90

set autoindent              "Auto indent
set smartindent             "Smart indentt
set wrap                    "Wrap lines

set showbreak=↳                "↪ как альтернатива

""""""""""""""""""""""""""""""
"#   Lot's of other's
""""""""""""""""""""""""""""""
"   Причина ошибки в GOLANG and workaround

" automatically changes Vim's working dir to the current file:
autocmd BufEnter * silent! :lcd%:p:h | redraw!

autocmd BufLeave,BufWinLeave * silent! mkview
autocmd BufReadPost * silent! loadview

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
if has("win32")
    set viminfo='10,\"100,:20,%,nc:\\Users\\user\\_viminfo
else
    " set viminfo='10,\"100,:20,%,n~/.viminfo
    "Commented line above and pasted line below - from startify-faq "history files doesn't appears"
    set viminfo='100,n$HOME/.vim/files/info/viminfo
endif


" 'this one for t-pope's commenter plugin - который я не использую!
" autocmd FileType apache setlocal commentstring=#\ %s

filetype on
filetype plugin on
filetype plugin indent on

" by default, hide gui menus
set guioptions=i
set guioptions-=m               "remove menu bar
set guioptions-=T               "remove toolbar

set softtabstop=4
" Set to auto read when a file is changed from the outside
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
filetype off
filetype plugin on
filetype plugin indent on
set nu
set rnu                          " rnu а значит relative number. It was three hours of my live
set belloff=all                 "desable bell
set tabstop=4                   " set tabs for a shifttabs logic
set exrc                       " enable usage of additional .vimrc files from working directory
set secure                      " prohibit .vimrc files to execute shell, create files, etc...
"
" Do not show stupid q: window
 map q: :q

"=====================================================
"#    Russian localisation
"=====================================================
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


""""""""""""""""""""""""""""""
"#  kitty terminal vim bug
" https://sw.kovidgoyal.net/kitty/faq.html 
""""""""""""""""""""""""""""""
let &t_ut=''
