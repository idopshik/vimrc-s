" platform/linux.vim — Настройки для Linux
" ══════════════════════════════════════════════════════════════════════════════

" === Пути для backup/swap/undo ===
if !exists('$SUDO_USER')
    " Backup
    set backupdir=~/.vim/backup
    set backupdir+=.
    set backup
    
    " Swap
    set directory=~/.vim/swapfiles
    set directory+=.
    set swapfile
    
    " Undo
    set undodir=~/.vim/undodir
    set undodir+=.
    set undofile
    
    " Создаём директории если не существуют
    call MakeDirIfNoExists("~/.vim/backup")
    call MakeDirIfNoExists("~/.vim/undodir")
    call MakeDirIfNoExists("~/.vim/swapfiles")
endif

" === Tags ===
let g:easytags_cmd = 'ctags'
let g:tagbar_ctags_bin = 'ctags'

" === Python ===
" Для ALE
let g:ale_python_autopep8_executable = 'autopep8'

" === Wiki paths ===
let g:wiki_path = '/home/st/MegaLinux/tech.wiki'

" === Vimwiki ===
let g:vimwiki_list = [{'path': '/home/st/MegaLinux/tech.wiki/',
                     \ 'syntax': 'default', 'ext': '.wiki'}]

" === Clipboard (X11) ===
if has('clipboard')
    if has('unnamedplus')
        " Используем системный clipboard (Ctrl+C/V в других приложениях)
        set clipboard=unnamedplus
    endif
endif

" === Терминал ===
" xkb-switch для переключения раскладки при выходе из insert mode
" Требуется установить: https://github.com/grstreten/libxkbswitch
if filereadable('/usr/local/lib/libxkbswitch.so')
    let g:XkbSwitchLib = '/usr/local/lib/libxkbswitch.so'
elseif filereadable('/usr/lib/libxkbswitch.so.1.8.5')
    let g:XkbSwitchLib = '/usr/lib/libxkbswitch.so.1.8.5'
endif

" === Browser для HTML preview ===
let g:browser_cmd = 'firefox'

" === AsyncRun settings ===
let g:asyncrun_open = 6
let g:asyncrun_bell = 1
