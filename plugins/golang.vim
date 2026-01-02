" plugins/golang.vim — Go-специфичные плагины и completion
" ══════════════════════════════════════════════════════════════════════════════

" === vim-go (основной) ===
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" === Go completion ===
" Используем deoplete для Go вместо YCM
Plug 'Shougo/deoplete.nvim'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

if !has('nvim')
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" === Настройки deoplete для Go ===
let g:deoplete#enable_at_startup = 0  " Включается только для Go

" === vim-go настройки ===
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" === Go keymaps ===
augroup GoMappings
    autocmd!
    autocmd FileType go nmap <buffer> <leader>r <Plug>(go-run)
    autocmd FileType go nmap <buffer> <leader>b <Plug>(go-build)
    autocmd FileType go nmap <buffer> <leader>t <Plug>(go-test)
    autocmd FileType go nmap <buffer> <leader>c <Plug>(go-coverage)
    autocmd FileType go nmap <buffer> <leader>i <Plug>(go-info)
    autocmd FileType go nmap <buffer> gd <Plug>(go-def)
    autocmd FileType go nmap <buffer> K <Plug>(go-doc)
augroup END
