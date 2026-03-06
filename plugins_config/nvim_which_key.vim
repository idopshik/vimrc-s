" plugins_config/nvim_which_key.vim — Which-key configuration
if !exists('g:did_which_key')
    finish
endif

lua << EOF
local wk = require("which-key")
wk.setup({
    window = {
        border = "rounded",      -- красивая рамка
        position = "center",     -- по центру экрана
    },
    icons = {
        breadcrumb = "»",
        separator = "➜",
    },
})

-- Регистрируем основные prefix-ы
wk.register({
    ["<leader>"] = {
        ["]"] = { "SmartOpenTmpPy", "Quick tmp.py" },
        ["f"] = { "SearchWordWithRg", "Search word" },
        ["B"] = { "Python breakpoint", "Add pdb trace" },
        ["m"] = { "QuickMenu", "Main menu" },
        ["2"] = { "Debug menu", "Debug & tools" },
        ["v"] = { "Vifm", "File manager" },
        ["x"] = { "Ranger", "Ranger" },
        ["n"] = { "Notes", "Common notes" },
        ["k"] = { "Vim cheat", "Vim cheatsheet" },
        ["b"] = { "Buffers", "Buffer list" },
        ["h"] = { "Help tags", "Help" },
        ["r"] = { "Files ~/.vim", "Config files" },
        ["cd"] = { "Change dir", "cd to file dir" },
        ["a"] = { "Ack", "Search ack" },
        ["nn"] = { "NERDTree find", "Find in tree" },
        ["d"] = {
            name = "+Debug (Vimspector)",
            d = { "Continue", "Continue debug" },
            b = { "Breakpoint", "Toggle breakpoint" },
            s = { "Stop", "Stop debugging" },
            o = { "Step over", "Step over" },
            i = { "Step into", "Step into" },
        },
        ["w"] = {
            name = "+Wiki (Vimwiki)",
            p = { "Prev day", "Previous day" },
            n = { "Next day", "Next day" },
        },
    },
}, { prefix = "" })

EOF
