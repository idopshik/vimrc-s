" ==========================================================
" plugins/nerdtree.vim — настройки NERDTree
" ==========================================================

nnoremap <leader>n :NERDTreeToggle<CR>
autocmd VimEnter * if !argc() | NERDTree | endif
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_' && winnr('$') == 1 | quit | endif

let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=35
nnoremap <leader>nf :NERDTreeFind<CR>
