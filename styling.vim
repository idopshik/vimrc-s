
" doesnt work
" set noshowmode    "remove mode indicator(insert/normal)

set cursorline
" set cursorcolumn
hi CursorLine term=bold cterm=bold guibg=Grey40
" :nnoremap H :set cursorline! cursorcolumn!<CR>
:nnoremap H :set cursorline!<CR>
set guicursor+=a:blinkon0
"=====================================================
"" Colorscheme
"=====================================================
" Тонкости темы sierra
" let g:sierra_Sunset = 1
" let g:sierra_Twilight = 1
" let g:sierra_Midnight = 1
" let g:sierra_Pitch = 1

" ket t_Co=256   " This is may or may not needed.
set background=dark

if has('win32')
    ":set guifont=lucida_console:h12:w6:b:cRUSSIAN
    ":set guifont=DejaVu_Sans_Mono_for_Powerline:h10
    ":set guifont=InconsolataCyr:h13  Eсть на Yдиске"
    "set guifont=Droid_Sans_Mono_Dotted_for_Powerline:h12
    " :set guifont=Droid_Sans_Mono_for_Powerline:h10:cRUSSIAN:qDRAFT

:set  guifont=DejaVu_Sans_Mono_for_Powerline:h10:cRUSSIAN:qDRAFT

endif

if has('unix')
    " set guifont=Droid_Sans_Mono_Dotted_for_Powerline/10
    "set guifont=Monospace\ 14
    " set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 15
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Oblique\ 15     "Ты ж хотел italic - не обляпайся"
    " set guifont=DroidSansMono\ Nerd\ Font\ Oblique\ 15

endif

if has('gui_running')
    colorscheme PaperColor "dark and nice
    " colorscheme gruvbox
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
"" Separators in airline-statusline
"=====================================================
"
"Dev-icons загружаются как плагин в файле extended
"https://awesomeopensource.com/project/ryanoasis/powerline-extra-symbols
if has('gui_running')
else
    " testing separators (extra-powerline-symbols):
    let g:airline_left_sep = "\uE0C6" "pixels
    let g:airline_right_sep = "\uE0C7"

    " set the CN (column number) symbol:
    " Это делает мелким и нечитаемым. Но компактным. Считчик строк.
    " let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])
endif
