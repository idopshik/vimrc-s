
" ==========================================================
" plugins.vim — менеджер плагинов (vim-plug)
" ==========================================================


filetype off
" === Начало блока плагинов ===
call plug#begin('~/.vim/plugged')

" ---------- Основные ----------
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ---------- Линтеры / форматирование ----------
Plug 'dense-analysis/ale'
Plug 'vim-syntastic/syntastic'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" ---------- Работа с текстом ----------
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" ---------- Git ----------
Plug 'tpope/vim-fugitive'

" ---------- Wiki / заметки ----------
Plug 'vimwiki/vimwiki'

" ---------- Поиск ----------
Plug 'mileszs/ack.vim'
if executable('fzf')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
endif

" ---------- Современные плагины для Neovim ----------
if has('nvim')
  " LSP + completion
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'

  " Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Telescope
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
  Plug 'nvim-lua/plenary.nvim'
endif

call plug#end()
filetype on
