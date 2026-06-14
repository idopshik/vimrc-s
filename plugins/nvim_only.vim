" plugins/nvim_only.vim — Плагины только для Neovim
" ══════════════════════════════════════════════════════════════════════════
" Здесь nvim-specific плагины. Keymaps остаются теми же!
" ══════════════════════════════════════════════════════════════════════════

" === Treesitter — ОТКЛЮЧЕН (parser version mismatch) ===
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" === Telescope (замена FZF для Neovim) ===
" fzf-native требует make/gcc — на Windows не компилируется, не ставим
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" === Which-key (показывает keymaps на leader) ===
" Plug 'folke/which-key.nvim'

" === Markdown Preview + Live Server ===
" Plug 'selimacerbas/live-server.nvim'
" Plug 'selimacerbas/markdown-preview.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install' }


" === VimTeX (LaTeX) ===
Plug 'lervag/vimtex'
