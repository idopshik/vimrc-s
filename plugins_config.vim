" vim: fdm=expr
"


"=====================================================
"#       DAP
"=====================================================
"
lua require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

" lua << EOF
" require("dap-python").setup("/usr/bin/python")

" table.insert(require("dap").configurations.python, {
    " type = "python",
    " request = "launch",
    " name = "Module",
    " console = "integratedTerminal",
    " module = "src", -- edit this to be your app's main module
    " cwd = "${workspaceFolder}",
" })
" EOF


" lua << EOF
    " vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
    " vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
    " vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
    " vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
    " vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
    " vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
    " vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    " vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
    " vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
    " vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
      " require('dap.ui.widgets').hover()
    " end)
    " vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
      " require('dap.ui.widgets').preview()
    " end)
    " vim.keymap.set('n', '<Leader>df', function()
      " local widgets = require('dap.ui.widgets')
      " widgets.centered_float(widgets.frames)
    " end)
    " vim.keymap.set('n', '<Leader>ds', function()
      " local widgets = require('dap.ui.widgets')
      " widgets.centered_float(widgets.scopes)
    " end)
" EOF




"
"=====================================================
"#       Vimspector
"=====================================================

" установить с :vimspectorinstall debugpy
" в каждом проекте должне быть свой .vimspector.json file

" now you can run :vimspectorinstall :vimspectorupdate  with no arguments
let g:vimspector_install_gadgets = [ 'debugpy']

map <f10> <plug>vimspectorlaunch
map <f12> <plug>vimspectorcontinue

"не работает почему-то.
" nnoremap <f10> <plug>vimspectorlaunch
map <f11> :call vimspector#reset()<cr>
" nnoremap <f12> <plug>vimspectorcontinue - space-c жмёшь.

"не работает почему-то.
" nnoremap <f8> <plug>vimspectorreset 


map <leader>db <plug>vimspectorbreakpoints


" vim.keymap.set(n, ",<leader>dt", "<Cmd>vimspectortogglebreakpoint next", {silent = true, remap = true})

map <leader>dt <plug>vimspectortogglebreakpoint

let s:mapped = {}

function! s:onjumptoframe() abort
  if has_key( s:mapped, string( bufnr() ) )
    return
  endif

  " надо убедиться что пробел не замаплен
  map <localleader>t :call vimspector#togglebreakpoint()<cr>
  " map <localleader>t :call vimspector#clearbreakpoints()<cr>

  nmap <silent> <buffer> <localleader>o <plug>vimspectorstepover
  nmap <silent> <buffer> <localleader>n <plug>vimspectorstepinto
  nmap <silent> <buffer> <localleader>a <plug>vimspectorstepout
  nmap <silent> <buffer> <localleader>c <plug>vimspectorcontinue
  map <silent> <buffer> <localleader>i <plug>vimspectorballooneval
  map <silent> <buffer> <localleader>i <plug>vimspectorballooneval

  let s:mapped[ string( bufnr() ) ] = { 'modifiable': &modifiable }

  setlocal nomodifiable

endfunction

function! s:ondebugend() abort

  let original_buf = bufnr()
  let hidden = &hidden
  augroup vimspectorswapexists
    au!
    autocmd swapexists * let v:swapchoice='o'
  augroup end

  try
    set hidden
    for bufnr in keys( s:mapped )
      try
        execute 'buffer' bufnr

        silent! nunmap <buffer> <localleader>t
        silent! nunmap <buffer> <localleader>t

        silent! nunmap <buffer> <localleader>o
        silent! nunmap <buffer> <localleader>n
        silent! nunmap <buffer> <localleader>a
        silent! nunmap <buffer> <localleader>c
        silent! nunmap <buffer> <localleader>i
        silent! xunmap <buffer> <localleader>i

        let &l:modifiable = s:mapped[ bufnr ][ 'modifiable' ]
      endtry
    endfor
  finally
    execute 'noautocmd buffer' original_buf
    let &hidden = hidden
  endtry

  au! vimspectorswapexists

  let s:mapped = {}
endfunction

augroup testcustommappings
  au!
  autocmd user vimspectorjumpedtoframe call s:onjumptoframe()
  autocmd user vimspectordebugended ++nested call s:ondebugend()
augroup end

" }}}

" custom mappings for special buffers {{{

let g:vimspector_mappings = {
      \   'stack_trace': {},
      \   'variables': {
      \    'set_value': [ '<tab>', '<c-cr>', 'c' ],
      \   }
      \ }

" }}}










"=====================================================
"#       GitGutter
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
" let NERDTreeShowHidden=0 - в документации вообще не бьётся! Что это за чушь,

"close vim if nerd three left alone
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"}}}
"=====================================================
"#       TagBar settings   {{{
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=36
"autocmd BufEnter *.py :call tagbar#autoopen(0)
"autocmd FileType * nested :call tagbar#autoopen(0)

" let g:tagbar_map_close = '<C-m>'   "hidious bag - tag bar closing by <CR>
" let g:tagbar_iconchars = ['+', '-']

" Раздражает это
" autocmd FileType python nested :TagbarOpen

" let g:tagbar_ctags_bin = 'C:\Users\belousov\Progs\ctags\ctags.exe'

"let g:tagbar_ctags_bin = 'C:\Progs\ctags58\ctags.exe'
"Не сортировать по алфавиту по умолчанию
let g:tagbar_sort = 0

let g:tagbar_type_javascript = {
            \ 'ctagstype': 'javascript',
            \ 'kinds': [
                \ 'A:arrays',
                \ 'P:properties',
                \ 'T:tags',
                \ 'O:objects',
                \ 'G:generator functions',
                \ 'F:functions',
                \ 'C:constructors/classes',
                \ 'M:methods',
                \ 'V:variables',
                \ 'I:imports',
                \ 'E:exports',
                \ 'S:styled components'
                \ ]}

"----------------------------------------------------------------------
"                       vimwiki integration
let g:tagbar_type_vimwiki = {
            \   'ctagstype':'vimwiki'
            \ , 'kinds':['h:header']
            \ , 'sro':'&&&'
            \ , 'kind2scope':{'h':'header'}
            \ , 'sort':0
            \ , 'ctagsbin':'/home/st/Dropbox/Linux_or_Vim_related/vim_savings/vwtags.py'
            \ , 'ctagsargs': 'default'
            \ }
"}}}
"=====================================================
"#       IndentLines   {{{
"=====================================================
"         Возможно это требуется для WINDOWS. В линуксах всё это давало мне
"         оражневый фон под чёрточками
" Vim
" let g:indentLine_color_term = 239

" GVim
" let g:indentLine_color_gui = '#484b4c'

" Background (Vim, GVim)
" let g:indentLine_bgcolor_term = 202
" let g:indentLine_char = '¦'     " ¦, ┆, │, ▏

" let g:indentLine_setColors = 0 - show grayish highlights }}}
"=====================================================
"#       Syntastic === {{{
"=====================================================
"НЕ МЕНЯЙ БЕЗДУМНО ЭТИ НАСТРОЙКИ. ЧИТАЙ ОЧЕНЬ ВНИМАТЕЛЬНО.
"ПРО ОБА ЛИНТЕРА (они здесь друг друга дополняют)
"Currend state  - активно для с при сохранени. Для остальных пассивно.
"SyntasticInfo - list of avalible linters

"Разкомментируй три следующих строки и закомментируй в Coc!
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_c_checkers = ["make"]

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" YouCompleteMe не даёт ему работать make линтеру с "c" языком. Не знаю как исправить
let g:syntastic_mode_map = {
            \ "mode": "passive",
            \ "active_filetypes": ["c","h"],
            \ "passive_filetypes": ["sh","javascript"] } "Задолбал этот синтаситик. Пока не научился им ползоваться.
"в active можно добавить sh - будет его проверять
"и наоборот. Можно поствить его в пассиве - но это мало чего изменит
"SyntasticCheck - команда возбуждает линтер даже в пассивном состоянии
"ALE не может проверять SH (по карйней мере пришлось поставить shellcheck чтобы он начал,
"а синтастик и так мог. Штатным средвством sh)."

autocmd FileType c autocmd BufWritePost <buffer> :SyntasticCheck make  "Без этого YC мешает или окно сразу закрывается

"Keep sign column always open(vim's thing, not syntastic)
set signcolumn=yes
"}}}
"=====================================================
"#       w0rp/ale settings (linter)=== {{{
"=====================================================
" Некоторые линтеры отключены - смотри массив внизу.

let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
"
"between error navigation
nmap <silent> <M-A> <Plug>(ale_previous_wrap)
nmap <silent> <M-a> <Plug>(ale_next_wrap)

"show errors or warnings in my statusline
let g:airline#extensions#ale#enabled = 1

"Show 5 lines of errors (default: 10)
let g:ale_list_window_size = 5
" let g:ale_sign_column_always = 1  "keep sign column on (prevent flickering which I hate

":help g:ale_echo_msg_format
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 0

let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'python': ['black', 'yapf', 'autopep8'],
            \}
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0

"not continuously. Only after file saving.
" let g:ale_lint_on_text_changed = 'never'

"don't run after opening the file
" let g:ale_lint_on_enter = 0
"
"Проблемы с gcc - не линтеры не понимают, что avr папка на отшибе в gcc"
"об этом знает только make (gcc and avrgcc косячат)
" let g:ale_linters = {'c': ['make']}
" let g:ale_linters = {'c': ['clangtidy']}
"cpp - ale так видит h - заголовочники в AVR проектах
" let b:ale_linters = ['flake8', 'pylint']
let g:ale_linters = {'c': [], 'cpp' : [], 'javascript' : [], 'python' : ['flake8', 'pylint'],
            \'javascriptreact': ['eslint', 'tsserver']}

" hate.Don't set it on - vim has signcolumn=yes
"
"
" Autocopletion for ALE especially for JS. (I'm testing it)
" let g:ale_completion_enabled = 1 (tested. worked well. But Coc.)
"}}}
"=====================================================
"#       easytag settings (autogenerate tag's ))=== {{{
"=====================================================
"// istead of ~/.vimtags
"
" let g:easytags_cmd = 'C:\Users\belousov\Progs\ctags\ctags.exe'
let g:easytags_file = './tags'

"// no tag highlight
let g:easytags_auto_highlight = 0

"// (:help autocmd-events),events being watched by easytags
" let g:easytags_events = ['BufWritePost']

"// do not block vim during tag-file updating
"
"hour and a half debugging freezing on NEOVIM. Because of this thing:
" let g:easytags_async = 1
" <C-]> Jump to tag

"
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
    " let g:airline_theme='badcat' "supernice contrast black-gray
    ""let g:airline_theme='raven' "grayish supernice
    "simple - very good too"
else
    let g:airline_theme='raven' "grayish supernice
    " let g:airline_theme='badcat' "supernice contrast black-gray
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
"" fzf
"=====================================================
" Вот с этой строчкой не работает поиск файлов!!!
" let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

"=====================================================
"" Ack
"=====================================================

" cnoreabbrev Ack Ack!
let g:ack_mappings = {
            \  'v':  '<C-W><CR><C-W>L<C-W>p<C-W>J<C-W>p',
            \ 'gv': '<C-W><CR><C-W>L<C-W>p<C-W>J' }

"=====================================================
"#       snippets
"=====================================================
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

"c-expand mnemonic
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

"you should not remap c-e for it plugin!
" imap <C-e> <Plug>(coc-snippets-expand)
" vmap <C-j> <Plug>(coc-snippets-select)
" let g:coc_snippet_next = '<c-j>'
" let g:coc_snippet_prev = '<c-b>'
" imap <C-j> <Plug>(coc-snippets-expand-jump)

"Я не задаю папку со своими сниппетами, взамен создана simlink на
"UltiSnips папку в дропбоксе, ссылка указана в runtimepath, которая ~/.vim
"поэтому плагин её находит. (он шарит во всей runtimepath)
" UltiSnips и snipmate это разные типы снипетов, и их можно по отдельности
" выключать и использовать.

"=====================================================
"#       vimwiki   {{{
"=====================================================
" let g:vimwiki_folding='list' "неприлично долго искал собой же созданную проблуму.
"Либо эта переменная, либо уже foldmethod=syntax.
let g:vimwiki_folding='syntax'

"=====================================================
"#       Prettier  {{{
"=====================================================
" для WEB (js)
" <leader>-p - default prettier command
"на нравятся подтормаживания при запуске по F6. Буду "в ручную" гонять.
" autocmd BufWritePre *.jsx,*.js,*.json,*.css,*.scss,*.less,*.graphql Prettier

" forced async
let g:prettier#exec_cmd_async = 1
" Running before saving async
let g:prettier#autoformat = 0
nmap <Leader>py <Plug>(Prettier)
""}}

"=====================================================
"#       Autoformat  {{{
"=====================================================

" let g:formatters_python = ['autopep8', 'black']     "Возможно, и не надо.
" сам вроде находит и black и pep8

"=====================================================
"#       Vim-go
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

" bug with FOLDs go-vim https://github.com/fatih/vim-go/issues/502
let g:go_fmt_experimental = 1

"=====================================================
"#       Jedi-vim
"=====================================================
" <leader>r comflict! Я использую вызов :Files для папка с VIMRC
" Deactivate it here.
let g:jedi#rename_command="<Nop>"   " Она и так у меня не работала. Моргала и всё

"=====================================================
"#       vim-javascript
"=====================================================
" не знаю что это
let g:javascript_plugin_jsdoc = 1

" set conceallevel=0 Почему-0то игрнорируется.
" откуда-то ставится conceallevel=2. Не ясно чем.

" let g:javascript_conceal_function             = "ƒ"
" let g:javascript_conceal_null                 = "ø"
" let g:javascript_conceal_this                 = "@"
" let g:javascript_conceal_return               = "⇚"
" let g:javascript_conceal_undefined            = "¿"
" let g:javascript_conceal_NaN                  = "ℕ"
" let g:javascript_conceal_prototype            = "¶"
" let g:javascript_conceal_static               = "•"
" let g:javascript_conceal_super                = "Ω"
" let g:javascript_conceal_arrow_function       = "⇒"
" let g:javascript_conceal_noarg_arrow_function = "🞅"
" let g:javascript_conceal_underscore_arrow_function = "🞅"

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


"#       Emmet
"=====================================================


" let g:user_emmet_expandabbr_key = '<C-y>,'
" let g:user_emmet_expandword_key = '<C-y>;'
" let g:user_emmet_update_tag = '<C-y>u'
" let g:user_emmet_balancetaginward_key = '<C-y>d'
" let g:user_emmet_balancetagoutward_key = '<C-y>D'
let g:user_emmet_next_key = '<C-y>j'
let g:user_emmet_prev_key = '<C-y>b'
" let g:user_emmet_imagesize_key = '<C-y>i'
" let g:user_emmet_togglecomment_key = '<C-y>/'
" let g:user_emmet_splitjointag_key = '<C-y>j'
" let g:user_emmet_removetag_key = '<C-y>k'
" let g:user_emmet_anchorizeurl_key = '<C-y>a'
" let g:user_emmet_anchorizesummary_key = '<C-y>A'
" let g:user_emmet_mergelines_key = '<C-y>m'
" let g:user_emmet_codepretty_key = '<C-y>c'


"#       Startify
"=====================================================

let g:startify_session_dir = '~/.vim/session'
let g:startify_files_number = 10

let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]

let g:startify_bookmarks = [
            \ {'s': '~/Documents/MyJsScripts/s_module6/six.js'},
            \ {'v': '~/Documents/MyPyScripts/seven.py'},
            \ ]

"#       Misc

let g:rainbow_active = 0 "set to 0 if you want to enable it later via :RainbowToggle
