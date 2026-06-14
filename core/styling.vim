" core/styling.vim — Цвета, шрифты, визуальные настройки
" ══════════════════════════════════════════════════════════════════════════════

if has('termguicolors')
    set termguicolors
endif

" === Базовые визуальные настройки ===
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
set signcolumn=yes
set laststatus=2
set showmode
set showcmd
set cursorline
set list
set listchars=tab:→\ ,trail:·,extends:›,precedes:‹,nbsp:␣

if g:is_nvim
    set smoothscroll
endif

" === Настройка шрифта ===
if g:is_gui
    if g:is_win
        set guifont=Consolas:h11
    else
        set guifont=JetBrains\ Mono\ 11
    endif
endif

" === Функция для сброса фона (делает Neovim прозрачным) ===
function! Transparentize()
    highlight Normal guibg=NONE ctermbg=NONE
    highlight NormalNC guibg=NONE ctermbg=NONE
    highlight LineNr guibg=NONE ctermbg=NONE
    highlight SignColumn guibg=NONE ctermbg=NONE
    highlight VertSplit guibg=NONE
    highlight EndOfBuffer guibg=NONE
endfunction

" Автоматический сброс прозрачности при любой смене темы
autocmd ColorScheme * call Transparentize()

" ═══════════════════════════════════════════════════════════════════════════
" СИНХРОНИЗАЦИЯ VIM + WEZTERM
" ═══════════════════════════════════════════════════════════════════════════
" КАК ЭТО РАБОТАЕТ:
" - Vim colorscheme и WezTerm фон НЕ связаны автоматически
" - Ты должен нажимать ОБА:
"   1. :Theme1 (или :Tn1, :Tn2, :Tn3) в Vim
"   2. Ctrl+Alt+1 (или 2, 3) в WezTerm
" 
" Это отдельные приложения, они не видят друг друга!
" ═══════════════════════════════════════════════════════════════════════════

" === ТЕМА 1: OceanicNext (Синяя) ===
command! Theme1 colorscheme OceanicNext | let g:airline_theme = 'oceanicnext' | echom '✓ OceanicNext | Press Ctrl+Alt+1 in WezTerm'
command! Tn1 Theme1

" === ТЕМА 2: Gruvbox (Коричневая) ===
command! Theme2 colorscheme gruvbox | let g:airline_theme = 'gruvbox' | echom '✓ Gruvbox | Press Ctrl+Alt+2 in WezTerm'
command! Tn2 Theme2

" === ТЕМА 3: Solarized Light (Светлая) ===
command! Theme3 colorscheme solarized | let g:airline_theme = 'solarized' | echom '✓ Solarized | Press Ctrl+Alt+3 in WezTerm'
command! Tn3 Theme3

" === ДОПОЛНИТЕЛЬНО: Tokyo Night (для быстрого теста) ===
command! Theme9 colorscheme tokyonight | let g:airline_theme = 'tokyonight' | echom '✓ Tokyo Night | Press Ctrl+Alt+9 in WezTerm'

" === ПО УМОЛЧАНИЮ: Theme 1 (OceanicNext) ===
call execute('Theme1')
call Transparentize()
