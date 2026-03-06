" plugins/nvim_only.vim — Плагины только для Neovim
" ══════════════════════════════════════════════════════════════════════════════
" Здесь современные nvim-плагины. Keymaps остаются теми же!
" В будущем можно добавить telescope, nvim-tree и т.д.
" ══════════════════════════════════════════════════════════════════════════════

" === Treesitter (улучшенный syntax highlighting) ===
" Раскомментируй когда будешь готов к lua
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" === LSP (Language Server Protocol) ===
" Пока используем YCM/Jedi, но вот заготовка для nvim-lsp:
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'L3MON4D3/LuaSnip'

" === Telescope (замена fzf, но с теми же keymaps) ===
" Пока используем fzf, но вот заготовка:
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" === Nvim-tree (замена NERDTree, но с теми же keymaps) ===
" Пока используем NERDTree, но вот заготовка:
" Plug 'nvim-tree/nvim-web-devicons'
" Plug 'nvim-tree/nvim-tree.lua'

" === Which-key (показывает доступные keymaps) ===
Plug 'folke/which-key.nvim'

" === Better terminal ===
" Plug 'akinsho/toggleterm.nvim'

" === Git signs (лучше чем gitgutter для nvim) ===
" Plug 'lewis6991/gitsigns.nvim'

" === Indent guides (лучше для nvim) ===
" Plug 'lukas-reineke/indent-blankline.nvim'

" === Statusline (если хочешь заменить airline) ===
" Plug 'nvim-lualine/lualine.nvim'

" === Bufferline ===
" Plug 'akinsho/bufferline.nvim'

" ══════════════════════════════════════════════════════════════════════════════
" ЗАМЕТКА: Когда будешь готов к переходу на lua, раскомментируй нужные плагины
" и добавь конфигурацию в plugins_config/nvim_only.vim (или .lua файл)
"
" Главное правило: KEYMAPS ОСТАЮТСЯ ТЕ ЖЕ!
" <C-p> = файлы, <C-n> = file tree, <F9> = tagbar и т.д.
" ══════════════════════════════════════════════════════════════════════════════
