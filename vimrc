" .vimrc — Точка входа для Vim
" ══════════════════════════════════════════════════════════════════════════════
" Скопируй этот файл в ~/.vimrc (Linux) или ~/vimfiles/vimrc (Windows)
" ══════════════════════════════════════════════════════════════════════════════

" Путь к конфигурации
let g:vim_runtime = expand('~/.vim_runtime')

" Загружаем главный сборщик
if filereadable(g:vim_runtime . '/sammeln.vim')
    execute 'source ' . g:vim_runtime . '/sammeln.vim'
else
    echohl ErrorMsg
    echom 'ERROR: ~/.vim_runtime/sammeln.vim not found!'
    echom 'Make sure ~/.vim_runtime exists and contains the config'
    echohl None
endif
