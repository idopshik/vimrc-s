"#   Cursor line/column/color style
"=====================================================
" autocmd WinEnter * setlocal cursorline cursorcolumn
" autocmd WinLeave * setlocal nocursorline nocursorcolumn
" set guicursor+=a:blinkon0

set background=dark

" set t_Co=256 "TODO basic?

set termguicolors
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
    " :set guifont=DroidSansMono\ Nerd\ Font\ 19

    :set guifont=Iosevka\ Expanded\ 19
    " :set guifont=Iosevka\ Nerd\ Font\ Complete\ Mono\ 19
endif
if has("unix")
    function! FontSizePlus ()
      let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole + 1
      let l:new_font_size = ' '.l:gf_size_whole
      let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
    endfunction

    function! FontSizeMinus ()
      let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole - 1
      let l:new_font_size = ' '.l:gf_size_whole
      let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
    endfunction
else
    function! FontSizePlus ()
      let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole + 1
      let l:new_font_size = ':h'.l:gf_size_whole
      let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
    endfunction

    function! FontSizeMinus ()
      let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole - 1
      let l:new_font_size = ':h'.l:gf_size_whole
      let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
    endfunction
endif

command Font :call FontSizePlus()

"#   Colorscheme
"=====================================================
if has('gui_running')
    " colorscheme PaperColor "dark and nice
    " colorscheme gruvbox
    colorscheme solarized  "blue subdued
    " colorscheme OceanicNext
    " colorscheme spacegray
else
    colorscheme OceanicNext
    " colorscheme jellybeans
    " colorscheme gruvbox
    " colorscheme solarized  "blue subdued
endif

"must be here. AFTER colorscheme set up"
hi lCursor guibg=#00ff00          "highlight green cursor when keymap activated
