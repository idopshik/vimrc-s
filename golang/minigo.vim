
filetype off                  " required
call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'               " Nice start screen (COW)
Plug 'sirver/ultisnips'                 "doesn't come with any snippets itself
Plug 'honza/vim-snippets'               "commn snippets. Not enough.
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'nanotech/jellybeans.vim'
call plug#end() " }}}

"#    Style
set background=dark
set t_Co=256

"#   Font
set guifont=Iosevka\ Expanded\ 19
let g:solarized_termcolors=256
colorscheme jellybeans

"#    Go filetype
autocmd FileType go set omnifunc=go#complete#Complete

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'






















"=====================================================
"#       snippets
"=====================================================
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"
"#      Vim-go 
"=====================================================

let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

"должно быть и так включено
let g:go_code_completion_enabled = 0
