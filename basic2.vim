
" Don't show mode in cmd window - doesn't work.:w
set noshowmode          

"when a file is changed from the outside
set autoread

if has("win32")
    set langmenu=en_US.UTF-8              "menu (gvim)
    language en                           "messages / ui (vim)
    set encoding=utf-8                  "menu 
    set termencoding=utf-8
    let &pythonthreehome = 'C:\progs\Python37\'
    let &pythonthreedll = 'C:\progs\Python37\python37.dll'
    let &pythonhome = 'C:\progs\Python27\'
    let &pythondll = 'C:\progs\Python27\python27.dll'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=10                " let 10 lines before/after cursor during scroll
set showcmd                     " shows partial commands
set ruler                       " sets a permanent rule
set lazyredraw                  " only redraws if it is needed

"backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Wildmenu
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"#    Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Linebreak on 90 characters
set linebreak
set textwidth=80

set autoindent              "Auto indent
set smartindent             "Smart indentt
set wrap                    "Wrap lines

set showbreak=↳                "↪ как альтернатива

""""""""""""""""""""""""""""""
"#    Lot's of other's
""""""""""""""""""""""""""""""

" automatically changes Vim's working dir to the current file:
augroup AutoGroup
  autocmd!
  "vim-rooter,maybe
    " autocmd BufEnter * silent! :lcd%:p:h | redraw!
    autocmd BufWritePost,BufLeave,WinLeave ?* mkview
                                           " <-----------------------------------------------------
    autocmd BufReadPost ?* silent loadview
augroup END
set viewoptions-=options
set viewoptions-=curdir

"  '10  :  marks for up to 10 files
"  "100 :  lines for each register
"  :20  :  up to 20 lines of command-line history
"  %    :  buffer list
"  n... :  where to save the viminfo files
if has("win32")
    set viminfo='10,\"100,:20,%,nc:\\Users\\user\\_viminfo
else
    " set viminfo='10,\"100,:20,%,n~/.viminfo
    "Commented line above and pasted line below - from startify-faq "history files doesn't appear"
    set viminfo='100,n$HOME/.vim/files/info/viminfo
endif

" by default, hide gui menus
set guioptions=i
set guioptions-=m               "remove menu bar
set guioptions-=T               "remove toolbar

set laststatus=2                "always show status bar

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
"#    Kitty terminal vim bug
""""""""""""""""""""""""""""""
let &t_ut=''

""""""""""""""""""""""""""""""
"#    Highlight current buffer(might be annoing)
""""""""""""""""""""""""""""""
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline


