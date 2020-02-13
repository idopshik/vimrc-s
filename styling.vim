set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
" :nnoremap H :set cursorline! cursorcolumn!<CR>
:nnoremap H :set cursorline!<CR>
set guicursor+=a:blinkon0
set background=dark


"=====================================================
"#   Font
"=====================================================
if has('win32')
    " :set guifont=lucida_console:h12:w6:b:cRUSSIAN
    " :set guifont=DejaVu_Sans_Mono_for_Powerline:h10
    " :set guifont=InconsolataCyr:h13  Eсть на Yдиске"
    " :set guifont=Droid_Sans_Mono_Dotted_for_Powerline:h12
    " :set guifont=Droid_Sans_Mono_for_Powerline:h10:cRUSSIAN:qDRAFT
    :set  guifont=DejaVu_Sans_Mono_for_Powerline:h10:cRUSSIAN:qDRAFT
endif

if has('unix')
    " :set guifont=Monospace\ 14  
    " :set guifont=Droid_Sans_Mono_Dotted_for_Powerline/10
    " :set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 15
    " :set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Oblique\ 15     "italic"
    " :set guifont=DroidSansMono\ Nerd\ Font\ Oblique\ 15
    :set guifont=DroidSansMono\ Nerd\ Font\ 15
endif

"=====================================================
"#   Colorscheme
"=====================================================
if has('gui_running')
    " colorscheme PaperColor "dark and nice
    colorscheme gruvbox
    " set background=light
    " colorscheme solarized  "blue subdued
    " colorscheme OceanicNext
    " colorscheme spacegray
else
    colorscheme OceanicNext
    " colorscheme gruvbox
endif

"must be here. AFTER colorscheme set up"
hi lCursor guibg=#00ff00          "highlight green cursor when keymap activated 



"=====================================================
"#   Separators in airline-statusline
"=====================================================
    let g:airline_left_sep = "\uE0C6" "pixels
    let g:airline_right_sep = "\uE0C7"
