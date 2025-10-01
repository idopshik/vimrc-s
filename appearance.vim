" ==========================================================
" appearance.vim — оформление и UI
" ==========================================================

syntax enable
set background=dark
colorscheme desert

set cursorline
set number
set relativenumber
set laststatus=2

if has("termguicolors")
    set termguicolors
endif

let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

if has("gui_running")
    set guicursor=n-v-c:block-Cursor/lCursor, i-ci-ve:ver25-Cursor/lCursor, r-cr:hor20-Cursor/lCursor
    set guifont=Monospace\ 12
endif
