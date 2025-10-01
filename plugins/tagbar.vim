" ==========================================================
" plugins/tagbar.vim — настройки Tagbar
" ==========================================================

nnoremap <F9> :TagbarToggle<CR>
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 0
let g:tagbar_autofoldlevel = 1

let g:tagbar_type_python = {
    \ 'ctagstype': 'python',
    \ 'kinds': [
        \ 'i:imports:1',
        \ 'c:classes',
        \ 'f:functions'
    \ ],
    \ 'sro': '.',
    \ 'kind2scope': {
        \ 'c': 'class',
        \ 'f': 'function'
    \ },
    \ 'scope2kind': {
        \ 'class': 'c',
        \ 'function': 'f'
    \ }
\ }
