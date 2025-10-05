
" ==========================================================
" sammeln.vim — главный сборщик конфигурации
" Работает и на Linux (Vim), и на Windows (Neovim)
" ==========================================================

" Определение платформы и редактора (для универсальности)
let s:is_win = has('win32') || has('win64')
let s:is_nvim = has('nvim')
let s:is_linux = has('unix') && !has('macunix')  " Linux (не Darwin)

" Plug-загрузка (как в твоём оригинале, универсально для платформ)
filetype off
let data_dir = s:is_nvim ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin(s:is_win ? '~/_vim/plugged' : '~/.vim/plugged')  " Win/Linux пути


" ---------------- Плагины ----------------
if filereadable(expand("~/.vim_runtime/vimrcs/plugins/common.vim"))
  source ~/.vim_runtime/vimrcs/plugins/common.vim
endif
if filereadable(expand("~/.vim_runtime/vimrcs/plugins/colors.vim"))
  source ~/.vim_runtime/vimrcs/plugins/colors.vim
endif
if filereadable(expand("~/.vim_runtime/vimrcs/plugins/git.vim"))
  source ~/.vim_runtime/vimrcs/plugins/git.vim
endif
if filereadable(expand("~/.vim_runtime/vimrcs/plugins/python.vim"))
  source ~/.vim_runtime/vimrcs/plugins/python.vim
endif
if filereadable(expand("~/.vim_runtime/vimrcs/plugins/web.vim"))
  source ~/.vim_runtime/vimrcs/plugins/web.vim
endif
if filereadable(expand("~/.vim_runtime/vimrcs/plugins/utils.vim"))
  source ~/.vim_runtime/vimrcs/plugins/utils.vim
endif

" ---------------- Селективная загрузка ----------------
if has('unix') && !has('nvim')
  if filereadable(expand("~/.vim_runtime/vimrcs/plugins/linux_only.vim"))
    source ~/.vim_runtime/vimrcs/plugins/linux_only.vim
  endif
endif

if has('nvim') && (has('win32') || has('win64'))
  if filereadable(expand("~/.vim_runtime/vimrcs/plugins/windows_nvim.vim"))
    source ~/.vim_runtime/vimrcs/plugins/windows_nvim.vim
  endif
endif

call plug#end()
filetype plugin indent on  " Включили filetype и indent
syntax enable              " Синтаксис

" ---------------- Настройки плагинов ----------------
for f in split(glob("~/.vim_runtime/vimrcs/plugins/settings/*.vim"), "\n")
  exe 'source' f
endfor

" ---------------- Базовые настройки ----------------
if filereadable(expand("~/.vim_runtime/vimrcs/settings.vim"))
  source ~/.vim_runtime/vimrcs/settings.vim
endif

" ---------------- Клавиши ----------------
if filereadable(expand("~/.vim_runtime/vimrcs/keymaps.vim"))
  source ~/.vim_runtime/vimrcs/keymaps.vim
endif

" ---------------- Автокоманды ----------------
if filereadable(expand("~/.vim_runtime/vimrcs/autocmds.vim"))
  source ~/.vim_runtime/vimrcs/autocmds.vim
endif

" ---------------- Пользовательские функции ----------------
if filereadable(expand("~/.vim_runtime/vimrcs/functions.vim"))
  source ~/.vim_runtime/vimrcs/functions.vim
endif

" ---------------- Цветовая схема ----------------
if filereadable(expand("~/.vim_runtime/vimrcs/styling.vim"))
  source ~/.vim_runtime/vimrcs/styling.vim
endif
" ==========================================================
" Конец sammeln.vim
" ==========================================================



