" plugins_config/nvim_only.vim — Конфигурация для Neovim-specific плагинов
" ══════════════════════════════════════════════════════════════════════════════
" Когда будешь готов к Lua-плагинам, раскомментируй нужное
" ══════════════════════════════════════════════════════════════════════════════

" === Пока используем те же плагины что и Vim ===
" Все keymaps работают одинаково!

" === ЗАГОТОВКА: Telescope (замена FZF) ===
" Когда подключишь telescope, добавь эти маппинги:
" (они используют ТЕ ЖЕ клавиши что и FZF!)
"
" lua << EOF
" local builtin = require('telescope.builtin')
" vim.keymap.set('n', '<C-p>', builtin.find_files, {})
" vim.keymap.set('n', '<leader><Space>', builtin.oldfiles, {})
" vim.keymap.set('n', '<leader>b', builtin.buffers, {})
" vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
" vim.keymap.set('n', '<leader>f', builtin.grep_string, {})
" EOF

" === ЗАГОТОВКА: nvim-tree (замена NERDTree) ===
" Когда подключишь nvim-tree:
"
" lua << EOF
" require('nvim-tree').setup({
"   view = { width = 30 },
"   filters = { dotfiles = false },
" })
" -- ТЕ ЖЕ клавиши!
" vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })
" vim.keymap.set('n', '<leader>nn', ':NvimTreeFindFile<CR>', { silent = true })
" EOF

" === ЗАГОТОВКА: Treesitter ===
" lua << EOF
" require('nvim-treesitter.configs').setup({
"   ensure_installed = { "python", "javascript", "typescript", "lua", "vim", "go" },
"   highlight = { enable = true },
"   indent = { enable = true },
" })
" EOF

" === ЗАГОТОВКА: LSP ===
" lua << EOF
" local lspconfig = require('lspconfig')
" 
" -- Python
" lspconfig.pyright.setup({})
" 
" -- TypeScript
" lspconfig.tsserver.setup({})
" 
" -- Go
" lspconfig.gopls.setup({})
" 
" -- Keymaps (стандартные)
" vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
" vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
" vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
" EOF

" === Neovim-specific настройки (работают сейчас) ===

" Терминал: сразу в insert mode
augroup NvimTerminal
    autocmd!
    autocmd TermOpen * startinsert
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" Подсветка yanked текста
augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})
augroup END


" ══════════════════════════════════════════════════════════════════════════════
" VimTeX (LaTeX) — компиляция через latexmk, просмотр в SumatraPDF (Windows)
" ══════════════════════════════════════════════════════════════════════════════

if has('nvim')
    " Метод компиляции: latexmk (лучший вариант)
    let g:vimtex_compiler_method = 'latexmk'
    
    " Настройки latexmk: складывать временные файлы в build/
    let g:vimtex_compiler_latexmk = {
        \ 'executable' : 'latexmk',
        \ 'build_dir' : 'build',
        \ 'options' : [
        \   '-lualatex',      % вместо -pdfxe
        \   '-interaction=nonstopmode',
        \   '-synctex=1',
        \   '-shell-escape',
        \ ],
    \}
    " Просмотрщик PDF для Windows (SumatraPDF)
    " Укажите полный путь, если SumatraPDF не в PATH
    let g:vimtex_view_general_viewer = 'C:/Progs/Sumatra/SumatraPDF-3.6.1-64.exe'
    let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
    
    " Если SumatraPDF не находится автоматически, укажите явно:
    " let g:vimtex_view_general_viewer = 'C:/Program Files/SumatraPDF/SumatraPDF.exe'
    
    " Для обратного поиска из SumatraPDF в Neovim:
    " Настройте SumatraPDF: Настройки → Дополнительные настройки → ReverseSearchCmdLine
    " Пример строки:
    " ReverseSearchCmdLine = "C:\\Program Files\\Neovim\\bin\\nvim.exe" --headless -c "VimtexInverseSearch %l '%f'"
    
    " Опционально: быстрые привязки (по умолчанию \ll, \lv и т.д. работают)
    " Не переопределяйте \ll, \lv, если не хотите менять стандартное поведение
endif
