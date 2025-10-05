" autocmds.vim
augroup MyAutoCmds
  autocmd!
  autocmd FocusGained,BufEnter * checktime
  autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup="IncSearch", timeout=200 }
  autocmd BufWritePre * %s/\s\+$//e
  autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
augroup END
