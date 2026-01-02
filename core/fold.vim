" core/fold.vim — Folding настройки
" ══════════════════════════════════════════════════════════════════════════════

" === Общие настройки ===
set foldmethod=indent
set foldlevel=99
set foldnestmax=10
set nofoldenable          " По умолчанию не сворачивать

" === Сохранение folds ===
set viewoptions=folds,cursor

" === Folding keymaps ===
" Space в normal mode переключает fold
nnoremap <silent> za za

" === Filetype-specific folding ===
augroup FoldingSettings
    autocmd!
    
    " Python: indent-based folding
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType python setlocal foldlevel=99
    
    " Vim: marker-based folding
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldmarker={{{,}}}
    
    " JavaScript/TypeScript: syntax folding
    autocmd FileType javascript,typescript setlocal foldmethod=syntax
    
    " JSON: syntax folding
    autocmd FileType json setlocal foldmethod=syntax
    
    " Markdown: не сворачивать
    autocmd FileType markdown setlocal nofoldenable
    
    " Git commit: не сворачивать
    autocmd FileType gitcommit setlocal nofoldenable
    
augroup END

" === SimpleFold настройки (для Python) ===
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 0
