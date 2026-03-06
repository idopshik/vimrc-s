lua << EOF
local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup({
    defaults = {
        prompt_prefix = " > ",
        selection_caret = " ",
        entry_prefix = "  ",
        
        -- Keybindings в Telescope окне
        mappings = {
            i = {  -- insert mode
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
                ["<C-n>"] = "move_selection_next",
                ["<C-p>"] = "move_selection_previous",
                ["<Esc>"] = "close",
            },
            n = {  -- normal mode
                ["j"] = "move_selection_next",
                ["k"] = "move_selection_previous",
                ["q"] = "close",
            },
        },
        
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                mirror = false,
                preview_width = 0.5,
            },
            width = 0.95,
            height = 0.95,
        },
        sorting_strategy = "ascending",
        preview = {
            hide_on_startup = false,
        },
    },
    pickers = {
        find_files = {
            theme = "dropdown",
            previewer = true,
            hidden = true,
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
})

telescope.load_extension('fzf')

-- Keymaps
vim.keymap.set('n', '<C-p>', builtin.find_files, { noremap = true })
vim.keymap.set('n', '<leader>r', function()
    builtin.find_files({ cwd = vim.fn.expand('~/.vim_runtime') })
end, { noremap = true })
vim.keymap.set('n', '<leader><Space>', builtin.oldfiles, { noremap = true })
vim.keymap.set('n', '<leader>.', function()
    builtin.find_files({ cwd = vim.fn.expand('%:h') })
end, { noremap = true })
vim.keymap.set('n', '<leader>b', builtin.buffers, { noremap = true })
vim.keymap.set('n', '<leader>h', builtin.help_tags, { noremap = true })

EOF
