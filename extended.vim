" ________________________________________________________________________
"                ____  _  _  ____  ____  _  _  ____  ____  ____
"               ( ___)( \/ )(_  _)( ___)( \( )(  _ \( ___)(  _ \
"                )__)  )  (   )(   )__)  )  (  )(_) ))__)  )(_) )
"               (____)(_/\_) (__) (____)(_)\_)(____/(____)(____/
"_________________________________________________________________________
"#      Annotation
" On Windows, use '.vim' instead of 'vimfiles': this makes synchronization
" across heterogeneous Windows/POSIX environments easier.
" let s:MSWindows = has('win95') + has('win16') + has('win32') + has('win64')

" if s:MSWindows
"    set runtimepath=$VIM/.vim,$VIMRUNTIME,$VIM/vimfiles/after,$VIM/.vim/after
" endif

"=====================================================
"#      Plug loading begins in ./basic.vim
"=====================================================

"## ------------------=== Other ===----------------------
Plug 'christoomey/vim-tmux-navigator'

"sudo apt-get install wmctrl    # Ubuntu/Debian - needed. Terminal dosn't execute ctrl+<CR>
Plug 'lambdalisue/vim-fullscreen'          "Ctrl + <CR> (does) :FullscreenToggle  On linux only.

Plug 'mattn/calendar-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-surround'               " Parentheses, brackets, quotes, XML tags, and more
Plug 'xolox/vim-misc'                   " required
Plug 'scrooloose/nerdcommenter'         " :help nerdcommenter
Plug 'godlygeek/tabular'
Plug 'tmhedberg/simpylfold'             " No-BS Python code folding for Vim

Plug 'mbbill/undotree'                   

" html md показывает, css js нет.
Plug 'shime/vim-livedown' "До установки установить $ npm install -g livedown
"Смотри на сайте. Есть доп.команда по установке!
Plug 'junegunn/goyo.vim' " :Goyo

"## --------------=== Snippets support ===---------------
Plug 'sirver/ultisnips'                   "doesn't come with any snippets itself
Plug 'honza/vim-snippets'                 "commn snippets. Not enough.
" Plug 'garbas/vim-snipmate'              " Snippets manager. Additional snippets.
" Plug 'MarcWeber/vim-addon-mw-utils'     " dependencies #1
" Plug 'tomtom/tlib_vim'                  " dependencies #2

"## --------------=== Code/project navigation ===-------------
Plug 'airblade/vim-rooter'
let g:rooter_silent_chdir = 1 "silent
Plug 'luochen1990/rainbow'   "colorful paranpheses
Plug 'skywind3000/quickmenu.vim'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

"---------===== Search with ACK ======---------------"
Plug 'mileszs/ack.vim'     "Возможно fzf-vim перекрывает этот плагин.

"## --------------=== Languages support ===-------------

Plug 'ap/vim-css-color'

Plug 'godlygeek/tabular'               "Markdown
Plug 'plasticboy/vim-markdown'

Plug 'w0rp/ale'                        
Plug 'vim-syntastic/syntastic'         "Настраивай линтеры, а не плагины.

Plug 'Chiel92/vim-autoformat'          "Используется внешний форматтер, надо установить
Plug 'Yggdroot/indentLine'             "Вертикальные линии

" Plug 'sheerun/vim-polyglot' - стоил мне часа дебага. dipshit plugin

"
"## --------------=== Git Integration====-----------------
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

"## --------------=== Colorschemes====-----------------
Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'mhartington/oceanic-next'
Plug 'ajh17/spacegray.vim'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'haishanh/night-owl.vim'
"
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"
"=====================================================
"#      Path's (по системам) {{{
"=====================================================

function! MakeDirIfNoExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), "p")
        echo("Missed swap/backup/undo directories.")
        echo expand(a:path)
    endif
endfunction

function! MakeDirIfNoExistsWindows(path)
    if !isdirectory(expand(a:path))

        call mkdir(expand(a:path), "p")
        echo expand(a:path)
    endif
endfunction

function! MakeDirIfNoExistsWindows(dir)
  if !isdirectory(a:dir)
    if exists("*mkdir")
      call mkdir(a:dir,'p')
      echo "Created directory: " . a:dir
    else
      echo "Please create directory: " . a:dir
    endif
  endif
endfunction



if has("win32")
    "Windows options here
        " Specific machine's file system related path's:
    "    :let &pythonthreehome = 'C:\Progs\python36\'
        ":let &pythonthreedll = 'C:\Progs\Python36\python36.dll'
        "
    :let &pythonhome = 'C:\Progs\Python27\'
    :let &pythondll = 'C:\Progs\Python27\python27.dll'
    :let g:easytags_cmd = 'c:\Progs\ctags58\ctags.exe'
    :let g:tagbar_ctags_bin = 'C:\Progs\ctags58\ctags.exe'

    cd c:\Users\isairon\Documents\                       "Home directory

    set backupdir=~\.vim\tmp\backup
    set backupdir+=.                        "last resort

    set directory=$HOME\.vim\swapfiles    "must exist, vim doesn't create one
    set directory+=.                        "last resort

    set undodir=$HOME\.vim\undodir   "must exist, vim doesn't create one
    set undodir+=.                        "last resort

    call MakeDirIfNoExistsWindows($HOME . '/.vim/tmp/backup')
    call MakeDirIfNoExistsWindows($HOME . '/.vim/swapfiles')
    call MakeDirIfNoExistsWindows($HOME . '/.vim/undodir')

    let g:startify_bookmarks = ['c:\Users\isairon\vimfiles\vimrc']     "Bookmarks'mhinz/vim-startify

    "python pep 8 не уверен, надо ли
    let g:ale_python_autopep8_executable = 'C:\Progs\Python37\Scripts\autopep8.exe'
    let g:ale_python_autopep8_use_global = 1

"=====================================================
"#      Files, backups and undo     {{{
"=====================================================
else
  if has("unix")

    let s:uname = system("uname")
    if s:uname == "Darwin\n"
      "Mac options here
    endif

    "Linux here (not Darvin)"
        if exists($SUDO_USER)
            set nobackup                            "don't make backups if sudo"
            set nowritebackup
        else
            set backupdir=~/.vim/tmp/backup
            set backupdir+=.                        "last resort
        endif

        if exists($SUDO_USER)
            set noswapfile                          "don't make swapfile if sudo"
        else
            set directory=~/.vim/swapfiles    "must exist, vim doesn't create one
            set directory+=.                        "last resort
        endif

        if exists($SUDO_USER)
            set noundofile                          "don't make undofile if sudo"
        else
            set undodir=~/.vim/undodir    "must exist, vim doesn't create one
            set undodir+=.                        "last resort
        endif

        " make this dirs if no exists previously
        call MakeDirIfNoExists("~/.vim/tmp/backup")
        call MakeDirIfNoExists("~/.vim/undodir")
        call MakeDirIfNoExists("~/.vim/swapfiles")
        
        let g:UltiSnipsSnippetDirectories=[$HOME.'/Dropbox/.vim_cloud/vim-snippets/UltiSnips']

  endif
endif

"=====================================================

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(":BufDiff")
    command BufDiff vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif
"" vim: fdm=expr
