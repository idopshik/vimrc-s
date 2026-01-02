" init.vim — Точка входа для Neovim
" ══════════════════════════════════════════════════════════════════════════════
" Скопируй этот файл в:
"   Linux:   ~/.config/nvim/init.vim
"   Windows: ~/AppData/Local/nvim/init.vim
" ══════════════════════════════════════════════════════════════════════════════

" Путь к конфигурации (тот же что и для Vim!)
let g:vim_runtime = expand('~/.vim_runtime')

" На Windows путь может быть другим
if has('win32') || has('win64')
    " Если ~/.vim_runtime не существует, пробуем Windows-путь
    if !isdirectory(g:vim_runtime)
        let g:vim_runtime = expand('~/vimfiles/vim_runtime')
    endif
endif

" Загружаем главный сборщик
if filereadable(g:vim_runtime . '/sammeln.vim')
    execute 'source ' . g:vim_runtime . '/sammeln.vim'
else
    echohl ErrorMsg
    echom 'ERROR: sammeln.vim not found!'
    echom 'Expected path: ' . g:vim_runtime . '/sammeln.vim'
    echom 'Make sure the config directory exists'
    echohl None
endif

" ══════════════════════════════════════════════════════════════════════════════
" ЗАМЕТКА ДЛЯ БУДУЩЕГО:
" Когда будешь готов к полному переходу на Lua, можешь создать init.lua:
"
" -- init.lua
" vim.g.vim_runtime = vim.fn.expand('~/.vim_runtime')
" vim.cmd('source ' .. vim.g.vim_runtime .. '/sammeln.vim')
"
" -- Затем постепенно добавлять Lua-конфигурацию:
" -- require('plugins.nvim_setup')  -- telescope, nvim-tree, etc.
" -- require('lsp.setup')           -- nvim-lspconfig
" -- require('treesitter.setup')    -- nvim-treesitter
"
" Keymaps останутся в keymap.vim (vimscript), они работают и в nvim!
" ══════════════════════════════════════════════════════════════════════════════
