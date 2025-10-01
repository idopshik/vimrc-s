" ==========================================================
" autocmds.vim — автокоманды
" ==========================================================

autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType make setlocal noexpandtab

autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline

autocmd FocusGained,BufEnter * checktime

autocmd FileType python nnoremap <buffer> <F5> :w<CR>:!python3 %<CR>
autocmd FileType markdown nnoremap <buffer> <leader>p :MarkdownPreview<CR>
