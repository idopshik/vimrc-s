" platform/windows.vim — Настройки для Windows
" ══════════════════════════════════════════════════════════════════════════════

" === Пути для backup/swap/undo ===
set backupdir=~\_vim\backup
set backupdir+=.

set directory=$HOME\_vim\swapfiles
set directory+=.

set undodir=$HOME\_vim\undodir
set undodir+=.

set backup
set swapfile
set undofile

" Создаём директории
call MakeDirIfNoExists($HOME . '/_vim/backup')
call MakeDirIfNoExists($HOME . '/_vim/swapfiles')
call MakeDirIfNoExists($HOME . '/_vim/undodir')

" === Python ===
" Укажи свой путь к Python если отличается
if isdirectory('C:\Python312')
    let &pythonthreehome = 'C:\Python312'
    let &pythonthreedll = 'C:\Python312\python312.dll'
elseif isdirectory('C:\Python311')
    let &pythonthreehome = 'C:\Python311'
    let &pythonthreedll = 'C:\Python311\python311.dll'
elseif isdirectory('C:\Python310')
    let &pythonthreehome = 'C:\Python310'
    let &pythonthreedll = 'C:\Python310\python310.dll'
endif

" === Tags (укажи свой путь к ctags) ===
if isdirectory('C:\Progs\ctags')
    let g:easytags_cmd = 'C:\Progs\ctags\ctags.exe'
    let g:tagbar_ctags_bin = 'C:\Progs\ctags\ctags.exe'
    let g:tagbar_use_cache = 0
elseif executable('ctags')
    let g:easytags_cmd = 'ctags'
    let g:tagbar_ctags_bin = 'ctags'
endif


" === ALE Python ===
" Укажи путь если autopep8 не в PATH
" let g:ale_python_autopep8_executable = 'C:\Python310\Scripts\autopep8.exe'
" let g:ale_python_autopep8_use_global = 1

" === Wiki paths (ИЗМЕНИ НА СВОИ!) ===
let g:wiki_path = expand('~/Documents/vimwiki/tech.wiki')

" === Vimwiki ===
let g:vimwiki_list = [{'path': expand('~/Documents/vimwiki/tech.wiki/'),
                     \ 'syntax': 'default', 'ext': '.wiki'}]

" === Startify bookmarks ===
let g:startify_bookmarks = [expand('~/vimfiles/vimrc')]

" === Домашняя директория при старте ===
" Раскомментируй если нужно
" cd ~\Documents

" === Shell ===
" Для совместимости с плагинами используем cmd.exe
set shell=cmd.exe
set shellcmdflag=/c
set shellquote=
set shellxquote=

" === Browser для HTML preview ===
let g:browser_cmd = 'start chrome'

" === AsyncRun settings ===
let g:asyncrun_open = 6
let g:asyncrun_bell = 1

" === GUI font (для gvim/nvim-qt) ===
if g:is_gui
    set guifont=Consolas:h11
    " Или если установлен Nerd Font:
    " set guifont=JetBrainsMono\ NF:h11
endif

" === Maximize window (gvim) ===
if g:is_gui && !g:is_nvim
    " Пробуем загрузить maximize.dll если есть
    if filereadable(g:vim_runtime . '/maximize.dll')
        " autocmd GUIEnter * call libcallnr(g:vim_runtime . '/maximize.dll', 'Maximize', 1)
    endif
endif

" === Fix для Temp директории в Neovim ===
if g:is_nvim
    " Neovim иногда создаёт странные пути для temp
    " let $TEMP = 'C:\Users\' . $USERNAME . '\AppData\Local\Temp'
endif
