"#   Cursor line/column/color style
"=====================================================
" autocmd WinEnter * setlocal cursorline cursorcolumn
" autocmd WinLeave * setlocal nocursorline nocursorcolumn
" set guicursor+=a:blinkon0

set background=dark
set t_Co=256

" TMUX
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"#   Font
"=====================================================
if has('win32')
    :set  guifont=DejaVu_Sans_Mono_for_Powerline:h10:cRUSSIAN:qDRAFT
endif

if has('unix')
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

let g:solarized_termcolors=256

"#   Colorscheme
"=====================================================
if has('gui_running')
    " colorscheme gruvbox
    colorscheme solarized8_flat  "blue subdued
    " colorscheme spacegray
else
    " colorscheme OceanicNext
    " colorscheme PaperColor "dark and nice
    colorscheme solarized8_flat  "blue subdued
    " colorscheme gruvbox
endif

"must be here. AFTER colorscheme set up"
hi lCursor guibg=#00ff00          "highlight green cursor when keymap activated
