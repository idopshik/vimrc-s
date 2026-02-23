" plugins/shared.vim — Общие плагины (vim-plug)
" ══════════════════════════════════════════════════════════════════════════════

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
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'

" === Python folding ===
Plug 'tmhedberg/simpylfold'

" === Undo tree ===
Plug 'mbbill/undotree'

" === Live preview ===
Plug 'shime/vim-livedown'

" === Multi-cursor ===
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" === Snippets ===
Plug 'epilande/vim-react-snippets'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" === Project navigation ===
Plug 'airblade/vim-rooter'
Plug 'luochen1990/rainbow'
Plug 'skywind3000/quickmenu.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
" Plug 'majutsushi/tagbar'
Plug 'preservim/tagbar'
Plug 'vifm/vifm.vim'

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

" === Python formatting ===
Plug 'psf/black', { 'branch': 'stable' }
Plug 'fisadev/vim-isort'
Plug 'nvie/vim-flake8'
Plug 'smbl64/vim-black-macchiato'

" === Jupyter ===
Plug 'untitled-ai/jupyter_ascending.vim'

" === Linting (КРИТИЧНО!) ===
Plug 'w0rp/ale'
Plug 'vim-syntastic/syntastic'

" === CSS color preview ===
Plug 'ap/vim-css-color'

" === Markdown ===
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

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
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'haishanh/night-owl.vim'
Plug 'ajmwagar/vim-deus'

" === Icons ===
Plug 'ryanoasis/vim-devicons'

" === Vimwiki ===
Plug 'vimwiki/vimwiki'
