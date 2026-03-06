" sammeln.vim — Центральный сборщик (Zentraler Sammler)
" Определяет платформу/редактор и загружает нужные модули
" ══════════════════════════════════════════════════════════════════════════════
"
"   Матрица поддержки:
"   ┌─────────────┬─────────────┬─────────────┐
"   │             │   Linux     │   Windows   │
"   ├─────────────┼─────────────┼─────────────┤
"   │     Vim     │  ✓ MAIN     │  ✓          │
"   │   Neovim    │  ✓ future   │  ✓          │
"   └─────────────┴─────────────┴─────────────┘
"
" ══════════════════════════════════════════════════════════════════════════════

" === Определение окружения ===
let g:is_win = has('win32') || has('win64')
let g:is_linux = has('unix') && !has('win32unix')
let g:is_nvim = has('nvim')
let g:is_vim = !g:is_nvim
let g:is_gui = has('gui_running')

" === АВТООПРЕДЕЛЕНИЕ ПУТИ ===
" Определяем где лежит этот файл (sammeln.vim) — работает везде!
let s:this_file = expand('<sfile>:p')
let g:vim_runtime = fnamemodify(s:this_file, ':h')

" === Пути (зависят от платформы) ===
if g:is_win
    let g:vim_home = expand('~/vimfiles')
    let g:plug_home = expand('~/_vim/plugged')
    let g:python_cmd = 'python'
else
    let g:vim_home = expand('~/.vim')
    let g:plug_home = expand('~/.vim/plugged')
    let g:python_cmd = 'python3'
endif

" === Минимальный режим (env MINIGO) ===
if $MINIGO
    execute 'source ' . g:vim_runtime . '/core/minigo.vim'
    finish
endif

" Добавляем runtime path
let &runtimepath = g:vim_runtime . ',' . &runtimepath

" === Функция безопасной загрузки ===
function! s:Source(file) abort
    let l:path = g:vim_runtime . '/' . a:file
    if filereadable(l:path)
        execute 'source ' . l:path
    else
        echohl WarningMsg
        echom 'sammeln: не найден ' . l:path
        echohl None
    endif
endfunction

function! s:SourceIfExists(file) abort
    let l:path = g:vim_runtime . '/' . a:file
    if filereadable(l:path)
        execute 'source ' . l:path
    endif
endfunction

" ══════════════════════════════════════════════════════════════════════════════
" ЭТАП 1: Базовые настройки (до плагинов)
" ══════════════════════════════════════════════════════════════════════════════

call s:Source('core/options.vim')        " set-опции
call s:Source('core/functions.vim')      " Общие функции

" Платформо-специфичные настройки (пути, python и т.д.)
if g:is_win
    call s:Source('platform/windows.vim')
else
    call s:Source('platform/linux.vim')
endif

" ══════════════════════════════════════════════════════════════════════════════
" ЭТАП 2: Плагины (vim-plug)
" ══════════════════════════════════════════════════════════════════════════════

filetype off

" Автоустановка vim-plug
let s:plug_path = g:is_nvim 
    \ ? stdpath('data') . '/site/autoload/plug.vim'
    \ : g:vim_home . '/autoload/plug.vim'

if empty(glob(s:plug_path))
    let s:plug_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    if g:is_win
        silent execute '!powershell -Command "Invoke-WebRequest -Uri ''' . s:plug_url . ''' -OutFile ''' . s:plug_path . '''"'
    else
        silent execute '!curl -fLo ' . s:plug_path . ' --create-dirs ' . s:plug_url
    endif
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(g:plug_home)

" Общие плагины (для всех)
call s:Source('plugins/shared.vim')

" Completion (зависит от $GO)
if $GO
    call s:Source('plugins/golang.vim')
else
    call s:Source('plugins/completion.vim')
endif

" Редактор-специфичные плагины
if g:is_nvim
    call s:SourceIfExists('plugins/nvim_only.vim')
else
    call s:SourceIfExists('plugins/vim_only.vim')
endif

call plug#end()

filetype plugin indent on
syntax enable

" ══════════════════════════════════════════════════════════════════════════════
" ЭТАП 3: Конфигурация (после плагинов)
" ══════════════════════════════════════════════════════════════════════════════

call s:Source('core/filetypes.vim')           " Filetype-настройки
call s:Source('plugins_config/shared.vim')    " Общая конфигурация плагинов

" Редактор-специфичная конфигурация
if g:is_nvim
    call s:SourceIfExists('plugins_config/nvim_only.vim')
    " Neovim which-key config
    call s:SourceIfExists('plugins_config/nvim_which_key.vim')
else
    call s:SourceIfExists('plugins_config/vim_only.vim')
endif

"
"

" ══════════════════════════════════════════════════════════════════════════════
" ЭТАП 4: Keymaps (СВЯЩЕННЫЕ — загружаются последними)
" ══════════════════════════════════════════════════════════════════════════════

call s:Source('core/keymap.vim')              " Главные keymaps (НЕ ТРОГАТЬ!)
call s:Source('core/quickmenu.vim')           " Quickmenu

" Платформо-специфичные keymaps (дополнения, не замены!)
if g:is_win
    call s:SourceIfExists('platform/windows_keys.vim')
endif

" ══════════════════════════════════════════════════════════════════════════════
" ЭТАП 5: Финализация
" ══════════════════════════════════════════════════════════════════════════════

call s:Source('core/autocmds.vim')            " Autocommands
call s:Source('core/fold.vim')                " Folding
call s:Source('core/styling.vim')             " Цвета, шрифты

" Локальные настройки (не в git, для machine-specific)
call s:SourceIfExists('local.vim')

" ══════════════════════════════════════════════════════════════════════════════
" Отладка: показать что загружено
" ══════════════════════════════════════════════════════════════════════════════
" :SammelnInfo — показывает информацию о текущем окружении
command! SammelnInfo call s:ShowInfo()

function! s:ShowInfo() abort
    echo '═══ Sammeln Info ═══'
    echo 'Platform: ' . (g:is_win ? 'Windows' : 'Linux')
    echo 'Editor:   ' . (g:is_nvim ? 'Neovim ' . matchstr(execute('version'), 'NVIM v\zs[^\n]*') : 'Vim ' . v:version)
    echo 'GUI:      ' . (g:is_gui ? 'Yes' : 'No')
    echo 'Python:   ' . g:python_cmd
    echo 'Plug dir: ' . g:plug_home
    echo 'Runtime:  ' . g:vim_runtime
endfunction
