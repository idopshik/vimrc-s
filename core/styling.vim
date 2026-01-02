" core/styling.vim — Цвета, шрифты, визуальные настройки
" ══════════════════════════════════════════════════════════════════════════════

" === True colors ===
if has('termguicolors')
    set termguicolors
endif

" === Background ===
set background=dark

" === Colorscheme ===
" Попробуем gruvbox, если не найден — fallback
try
    colorscheme gruvbox
catch
    try
        colorscheme desert
    catch
        " Ничего страшного, используем default
    endtry
endtry

" === Gruvbox настройки ===
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_invert_selection = 0

" === Airline theme ===
let g:airline_theme = 'gruvbox'

" === GUI шрифт ===
if g:is_gui
    if g:is_win
        set guifont=Consolas:h11
        " Или с Nerd Font:
        " set guifont=JetBrainsMono\ NF:h11
    else
        set guifont=JetBrains\ Mono\ 11
        " Или:
        " set guifont=Fira\ Code\ 11
    endif
endif

" === Cursor ===
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50

" === Sign column ===
set signcolumn=yes

" === Line numbers color ===
highlight LineNr guifg=#665c54
highlight CursorLineNr guifg=#fabd2f gui=bold

" === Vertical split line ===
highlight VertSplit guifg=#3c3836 guibg=NONE

" === Transparent background (опционально) ===
" let g:transparent_enabled = v:true
" highlight Normal guibg=NONE ctermbg=NONE
" highlight NonText guibg=NONE ctermbg=NONE

" === Status line всегда видна ===
set laststatus=2

" === Show mode в command line ===
set showmode

" === Show command в command line ===
set showcmd

" === Подсветка текущей строки ===
set cursorline

" === Подсветка 80 символов (опционально) ===
" set colorcolumn=80
" highlight ColorColumn guibg=#3c3836

" === Listchars (показ пробелов, табов) ===
set list
set listchars=tab:→\ ,trail:·,extends:›,precedes:‹,nbsp:␣

" === Neovim-specific ===
if g:is_nvim
    " Более плавный scroll
    set smoothscroll
endif
