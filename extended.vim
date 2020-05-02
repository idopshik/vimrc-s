" После изменения ALWAYS очищай папку .vim/view - Иначе хлопот не оберёшься.
" ________________________________________________________________________
"                ____  _  _  ____  ____  _  _  ____  ____  ____
"               ( ___)( \/ )(_  _)( ___)( \( )(  _ \( ___)(  _ \
"                )__)  )  (   )(   )__)  )  (  )(_) ))__)  )(_) )
"               (____)(_/\_) (__) (____)(_)\_)(____/(____)(____/
"_________________________________________________________________________
"#      Annotation
" Maybee I should do this:
" On Windows, use '.vim' instead of 'vimfiles': this makes synchronization
" across heterogeneous Windows/POSIX environments easier.
" let s:MSWindows = has('win95') + has('win16') + has('win32') + has('win64')

" if s:MSWindows
"    set runtimepath=$VIM/.vim,$VIMRUNTIME,$VIM/vimfiles/after,$VIM/.vim/after
" endif

"=====================================================
"#      Plug settings {{{
"=====================================================
filetype off                  " required
call plug#begin('~/.vim/plugged')

"## ------------------=== Other ===----------------------

"Just trying it
Plug 'christoomey/vim-tmux-navigator'

"sudo apt-get install wmctrl    # Ubuntu/Debian - needed. Terminal dosn't execute ctrl+<CR>
Plug 'lambdalisue/vim-fullscreen'          "Ctrl + <CR> (does) :FullscreenToggle  On linux only.

Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-surround'               " Parentheses, brackets, quotes, XML tags, and more
Plug 'xolox/vim-misc'                   " required
Plug 'scrooloose/nerdcommenter'         " :help nerdcommenter
Plug 'godlygeek/tabular'
Plug 'tmhedberg/simpylfold'             " No-BS Python code folding for Vim
" Plug 'jiangmiao/auto-pairs'           " :h autopairs  Как же она затрахала

Plug 'mhinz/vim-startify'               " Nice start screen (COW)
Plug 'mbbill/undotree'                   

" html b md показывает, css b js нет.
Plug 'shime/vim-livedown' "До установки установить $ npm install -g livedown
"Смотри на сайте. Есть доп.команда по установке!
Plug 'junegunn/goyo.vim' " :Goyo

"## --------------=== Snippets support ===---------------
"coc snippets could bit this. let's see!
Plug 'sirver/ultisnips'                 "doesn't come with any snippets itself
Plug 'honza/vim-snippets'               "commn snippets. Not enough.
" Plug 'garbas/vim-snipmate'              " Snippets manager. Additional snippets.
" Plug 'MarcWeber/vim-addon-mw-utils'     " dependencies #1
" Plug 'tomtom/tlib_vim'                  " dependencies #2

"## --------------=== Code/project navigation ===-------------
Plug 'luochen1990/rainbow'   "colorful paranpheses
Plug 'skywind3000/quickmenu.vim'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
":h fzf-vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'fisadev/FixedTaskList.vim'        " Pending tasks list

" TODO делаем debug здесь. Если перестанут затемняться страницы  и не нужно будте удалять view - 
" виноват и этот плагин и view. Но возможно перестань я использовать view этой проблемы не было бы.
" А если сохранится. то будет очивидно, на это не недеюсь, скорее всего тут combo. И надо выбрать из двух зол. Либо не дим, либо удалять. Bug  сам не найду.
" Plug 'blueyed/vim-diminactive'
"---------===== Search with ACK ======---------------"
Plug 'mileszs/ack.vim'     "Возможно fzf-vim перекрывает этот плагин.

"## --------------=== Languages support ===-------------

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

Plug 'ap/vim-css-color'

Plug 'Shougo/deol.nvim'                "Terminal support - haven't got the idea yet.
" Plug 'metakirby5/codi.vim'     I't just deepshit Need to remove it.

Plug 'godlygeek/tabular'               "Markdown
Plug 'plasticboy/vim-markdown'
" Plug 'neoclide/coc.nvim', {'branch': 'release'} "" Use release branch (Recommend)
Plug 'Valloric/YouCompleteMe'

Plug 'davidhalter/jedi-vim'     

" syntastici:w
Plug 'w0rp/ale'                        "Лучше и новее синтастика
Plug 'vim-syntastic/syntastic'         "Настраивай линтеры, а не плагины.

Plug 'Chiel92/vim-autoformat'          "Используется внешний форматтер, надо установить
Plug 'Yggdroot/indentLine'             "Вертикальные линии

Plug 'sheerun/vim-polyglot'
" ---------------=== Python ===-------------------
" Plug 'mitsuhiko/vim-jinja'              " Jinja support for vim
" Plug 'mitsuhiko/vim-python-combined'    " Combined Python 2/3 for Vim
" Plug 'vim-python/python-syntax'        "TEST IT TODO


" ---------------=== Javascript ===-------------------
Plug 'pangloss/vim-javascript'               " better indentetion and highlighting
" post install (yarn install | npm install)
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'turbio/bracey.vim' " css,html,js live 
" ---------------=== html ===-------------------
Plug 'mattn/emmet-vim'
"
"## --------------=== Git Integration====-----------------
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter' "
Plug 'junegunn/gv.vim'       "commit browser. :GV

"## --------------=== Colorschemes====-----------------
Plug 'NLKNguyen/papercolor-theme'
Plug 'AlessandroYorba/Sierra'
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
Plug 'severin-lemaignan/vim-minimap'  "minimap!

Plug 'ryanoasis/vim-devicons' "очень спорные иконки.
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"
call plug#end() " }}}
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

let g:vimwiki_list = [
            \{'path': '~/Dropbox/.vim_cloud/vimwiki/personal.wiki',
            \ 'template_path': '~/Dropbox/.vim_cloud/vimwiki/templates',
            \ 'template_default': 'default',
            \ 'template_ext': '.html' },
            \{'path': '~/Dropbox/.vim_cloud/vimwiki/tech.wiki'}
            \]


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

    " устарело. :let g:vimwiki_list = [{ 'path': 'c:/Users/isairon/Dropbox/vimwiki/'}]


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
    " }}}
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

        let g:vimwiki_list = [
                                \{'path': '~/Dropbox/.vim_cloud/vimwiki/tech.wiki',
                                \ 'template_path': '~/Dropbox/.vim_cloud/vimwiki/templates',
                                \ 'template_default': 'default',
                                \ 'template_ext': '.html' },
                                \{'path': '~/Dropbox/.vim_cloud/vimwiki/personal.wiki'}
                        \]
  endif
endif
" }}}
"=====================================================

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(":BufDiff")
    command BufDiff vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif
"" vim: fdm=expr
