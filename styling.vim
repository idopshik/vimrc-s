"
" styling.vim
if has('termguicolors')
  set termguicolors
endif
set background=dark
try
  colorscheme gruvbox
catch
  colorscheme desert
endtry
command! -nargs=1 Theme call SwitchColorscheme(<f-args>)

