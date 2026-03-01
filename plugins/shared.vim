" plugins/shared.vim — Общие плагины (vim-plug)
" ══════════════════════════════════════════════════════════════════════════════
" ОБНОВЛЕНО: убраны устаревшие плагины, добавлены современные
" ══════════════════════════════════════════════════════════════════════════════

" === Startify (стартовый экран) ===
Plug 'mhinz/vim-startify'

" === Debugger ===
Plug 'puremourning/vimspector'

" === Session ===
Plug 'tpope/vim-obsession'

" === Tmux integration ===
Plug 'christoomey/vim-tmux-navigator'

" === Cursor word highlight ===
Plug 'itchyny/vim-cursorword'

" === Calendar ===
Plug 'mattn/calendar-vim'

" === Status line ===
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" === Editing helpers ===
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'godlygeek/tabular'

" === Python folding ===
Plug 'tmhedberg/simpylfold'

" === Undo tree ===
Plug 'mbbill/undotree'

" === Live preview (Markdown) ===
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

" === Multi-cursor ===
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" === Snippets ===
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" === Project navigation ===
Plug 'airblade/vim-rooter'
Plug 'luochen1990/rainbow'
Plug 'skywind3000/quickmenu.vim'
Plug 'preservim/tagbar'

" === Search ===
Plug 'mileszs/ack.vim'

" === FZF (КРИТИЧНО!) ===
if g:is_win
    Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
else
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
endif
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

" === File tree (КРИТИЧНО!) ===
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" === Linting — ALE остаётся для не-Python ===
" Для Python используем ruff через coc
Plug 'dense-analysis/ale'

" === CSS color preview ===
Plug 'ap/vim-css-color'

" === Markdown ===
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

" === Autoformat ===
Plug 'Chiel92/vim-autoformat'
Plug 'Yggdroot/indentLine'

" === JavaScript/React ===
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" === CSV ===
Plug 'mechatroner/rainbow_csv'

" === Async run ===
Plug 'skywind3000/asyncrun.vim'

" === Git ===
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'
Plug 'idanarye/vim-merginal'

" === Colorschemes ===
Plug 'tribela/vim-transparent'
Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'folke/tokyonight.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'haishanh/night-owl.vim'
Plug 'ajmwagar/vim-deus'

" === Icons ===
Plug 'ryanoasis/vim-devicons'

" === Vimwiki ===
Plug 'vimwiki/vimwiki'

" === УДАЛЁННЫЕ ПЛАГИНЫ (заменены на coc) ===
" xolox/vim-misc — не нужен без easytags
" xolox/vim-easytags — устарел, медленный
" vim-syntastic/syntastic — заменён на coc diagnostics
" nvie/vim-flake8 — заменён на ruff через coc
" fisadev/vim-isort — заменён на ruff через coc
" psf/black — formatting через coc
" smbl64/vim-black-macchiato — не работает
" davidhalter/jedi-vim — заменён на coc-pyright
" mitsuhiko/vim-jinja — редко нужен
" mitsuhiko/vim-python-combined — устарел
" shime/vim-livedown — заменён на markdown-preview.nvim
" altercation/vim-colors-solarized — gruvbox лучше
" lifepillar/vim-solarized8 — gruvbox лучше
" vifm/vifm.vim — редко используется
