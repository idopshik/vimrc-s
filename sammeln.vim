" ==========================================================
" sammeln.vim — главный сборщик конфигурации
" ==========================================================

" === необходимость для запуска vim plug ===
source ~/.vim_runtime/vimrcs/plugins.vim
" === Базовая часть ===
source ~/.vim_runtime/vimrcs/core.vim
source ~/.vim_runtime/vimrcs/appearance.vim

" === Плагины ===
source ~/.vim_runtime/vimrcs/plugins/nerdtree.vim
source ~/.vim_runtime/vimrcs/plugins/tagbar.vim
source ~/.vim_runtime/vimrcs/plugins/airline.vim
source ~/.vim_runtime/vimrcs/plugins/lint.vim
source ~/.vim_runtime/vimrcs/plugins/misc.vim

" === Автокоманды и функции ===
source ~/.vim_runtime/vimrcs/autocmds.vim
source ~/.vim_runtime/vimrcs/functions.vim

" === ОС-специфика ===
if has("unix")
    source ~/.vim_runtime/vimrcs/os/linux.vim
elseif has("win32") || has("win64")
    source ~/.vim_runtime/vimrcs/os/windows.vim
endif

" === Редактор ===
if has("nvim")
    source ~/.vim_runtime/vimrcs/editor/nvim-only.vim
else
    source ~/.vim_runtime/vimrcs/editor/vim-only.vim
endif
