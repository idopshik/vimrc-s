" vim: fdm=expr
"no need in {{{
""TODO Этот файл излишний, он лишь дублирует основные. Не должно быть дублирующий 
" конструкций. Надо разбить основной файл, и отделить оттуда настройки загрузки плагинов - раз
" и настройки различных плагинов -два. либо в файлики, либо в папки по исключениям и языкам.

"=====================================================
"#       GitGutter  {{{
"=====================================================
" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn guibg=bg

" highlight SignColumn ctermbg=bg
"
" Update sign column every quarter second
set updatetime=250                " noplugins_vimrc - 1000.
autocmd BufWritePost * GitGutter  "force to refresh sighns - they always unrelayible!
"}}}
"=====================================================
"=====================================================
"=====================================================
"#       NERDTree settings {{{
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$', 'tags']     " Ignore files in NERDTree
let NERDTreeWinSize=35

let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDSpaceDelims = 1
let NERDTreeShowHidden=0

"close vim if nerd three left alone
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"}}}
"=====================================================
"#       TagBar settings   {{{
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=42

"----------------------------------------------------------------------
"                       vimwiki integration

let g:tagbar_type_vimwiki = {
          \   'ctagstype':'vimwiki'
          \ , 'kinds':['h:header']
          \ , 'sro':'&&&'
          \ , 'kind2scope':{'h':'header'}
          \ , 'sort':0
          \ , 'ctagsbin':'~/.vim_runtime/vimrcs/vwtags.py'
          \ , 'ctagsargs': 'default'
          \ }
"}}}
"=====================================================
"#       easytag settings (autogenerate tag's ))=== {{{
"=====================================================
"// istead of ~/.vimtags
let g:easytags_file = './tags'

"// no tag highlight
let g:easytags_auto_highlight = 0

"// (:help autocmd-events),events being watched by easytags
let g:easytags_events = ['BufWritePost']

"// do not block vim during tag-file updating
let g:easytags_async = 1
" <C-]> Jump to tag

" ctags -R *  Run in in bash in target folder, don't work instead
"
"
"}}}
"=====================================================
"#       AirLine settings {{{
"=====================================================
":AirlineTheme
if has('gui_running')
    " let g:airline_theme='solarized' "subdued
    " let g:airline_theme='dark_minimal' "yellow
    " let g:airline_theme='night_owl' "nice pastelle
    " let g:airline_theme='ouo' "nice colorfull blue-green
    let g:airline_theme='badcat' "supernice contrast black-gray
    ""let g:airline_theme='raven' "grayish supernice
    "simple - very good too"
else
    " let g:airline_theme='raven' "grayish supernice
    let g:airline_theme='badcat' "supernice contrast black-gray
    " let g:airline_theme='angr'
endif

let g:airline_powerline_fonts = 1

" " Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_min_count = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


" let g:airline_section_warning = ''
" let g:airline_section_error = ''
let g:airline#extensions#fugitiveline#enabled = 1

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = 'E:'
let g:airline#extensions#ycm#warning_symbol = 'W:'

let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
let airline#extensions#ale#show_line_numbers = 1

let g:airline#extensions#xkblayout#enabled = 0
let g:airline#extensions#keymap#enabled = 0

let airline#extensions#tabline#ignore_bufadd_pat = 'undotree|tagbar|nerd_tree'

 " Separators in airline-statusline - need's real NERD font!
let g:airline_left_sep = "\uE0C6" "pixels
let g:airline_right_sep = "\uE0C7"

" }}}
"=====================================================
"=====================================================
"#       Fugitive
"=====================================================
"
"bind git alias 'git lg' to fugitive-handled 'Glg' inside vim
command -nargs=* Glg Git! lg <args>
"
"=====================================================
"#       Toggle bar's and fullscreen
"=====================================================
"Toggle munu-bar, status-bar,right scroll line (Windows only)
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

"=====================================================
"=====================================================
"#       snippets
"=====================================================
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"
"#       vimwiki   {{{
"=====================================================
" let g:vimwiki_folding='list' "неприлично долго искал собой же созданную проблуму.
"Либо эта переменная, либо уже foldmethod=syntax.
let g:vimwiki_folding='syntax'

"=====================================================
"=====================================================

"=====================================================
"#       Goyo
"=====================================================
let g:goyo_width=100
let g:goyo_hight=70

"=====================================================
"#       Undotree
"=====================================================
let g:undotree_SplitWidth=30
let g:undotree_ShortIndicators = 1
let g:undotree_DiffAutoOpen = 0



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

"#       Startify
"=====================================================

    let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]

    let g:startify_bookmarks = [ {'s': '~/Documents/MyJsScripts/six.js'}]

"#       Misc

let g:rainbow_active = 0 "set to 0 if you want to enable it later via :RainbowToggle


