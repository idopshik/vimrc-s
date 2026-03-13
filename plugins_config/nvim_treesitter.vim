lua << EOF
-- Явно указываем компилятор gcc
require('nvim-treesitter.install').compilers = { "gcc" }

-- Опции установки
require('nvim-treesitter.install').prefer_git = false

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "python", "vim", "lua", "javascript", "bash"
  },
  
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  
  indent = {
    enable = true,
    disable = { "python" },
  },
  
  fold = {
    enable = true,
  },
  
  -- Настройки установки
  install = {
    ensure_installed = { "python", "vim", "lua", "bash" },
    compilers = { "gcc" },
  },
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

vim.cmd('command! TSStatus :echo "Treesitter OK"')
EOF
