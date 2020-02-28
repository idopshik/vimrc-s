" vim: fdm=expr
"=====================================================
"#       template {{{
"=====================================================

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
"#       CoC  {{{
"=====================================================

"for coc-vimlsp
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

    function! StatusDiagnostic() abort
      let info = get(b:, 'coc_diagnostic_info', {})
      if empty(info) | return '' | endif
      let msgs = []
      if get(info, 'error', 0)
        call add(msgs, 'E' . info['error'])
      endif
      if get(info, 'warning', 0)
        call add(msgs, 'W' . info['warning'])
      endif
      return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
    endfunction

" set statusline+=%{StatusDiagnostic()}
set statusline^=%{coc#status()} "Diagnostics info

    let g:airline#extensions#coc#enabled = 1
    let airline#extensions#coc#error_symbol = '⨉'
    let airline#extensions#coc#warning_symbol = '⚠'
    let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
    let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
"}}}
"=====================================================
"#       YouCompleteMe  {{{
"=====================================================
"special option, turned off YCM diagnostic display features. In feavour to Syntastic to
"work
"If you're using YCM's identifier completer in C-family languages but cannot use the clang-based
"semantic completer for those languages and want to use the GCC Syntastic checkers, unset this option.

let g:ycm_show_diagnostics_ui = 0


" set completeopt-=preview "не показывать окно preview с документацией.
let g:ycm_autoclose_preview_window_after_completion=1

let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=-1

" nmap <leader>g :YcmCompleter GoTo<CR>   "Это делает и джеди
" nmap <leader>d :YcmCompleter GoToDefinition<CR> "Это глючит как и у джеди

let g:ycm_server_python_interpreter='python' "Это ничего не поменяло
let g:ycm_key_list_select_completion = ['<Down>']

" let g:ycm_semantic_triggers = {
   " \   'css': [ 're!^\s{4}', 're!:\s+' ],
   " \ }
   "w/o whis css completion isn't working
let g:ycm_semantic_triggers = {
    \   'css': [ 're!^', 're!^\s+', ': ' ],
    \   'scss': [ 're!^', 're!^\s+', ': ' ],
    \ }
"}}}
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
"autocmd BufEnter *.py :call tagbar#autoopen(0)
"autocmd FileType * nested :call tagbar#autoopen(0)

"let g:tagbar_map_close = '<C-m>'   "hidious bag - tag bar closing by <CR>
" let g:tagbar_iconchars = ['+', '-'] only on win32 there uggy fonts
"only for specific filetypes
autocmd FileType python nested :TagbarOpen

"let g:tagbar_ctags_bin = 'C:\Progs\ctags58\ctags.exe'
"На линуксе теги сами обновляются с этими настройками - я проверял. Ничего
"самому запускать не надо
"
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

"Keep sign column always open(vim's thing, not syntastic)
set signcolumn=yes
"}}}
"=====================================================
"#       w0rp/ale settings (linter)=== {{{
"=====================================================
"СЕЙЧАС ВСЕ ЛИНТЕРЫ ОТКЛЮЧЕНЫ.
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
let g:ale_linters = {'c': [], 'cpp' : [], 'javascript' : []}  " disable ale for c language
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

let g:airline#extensions#keymap#enabled = 0
" }}}
"=====================================================
"#       LeaderF        {{{
"=====================================================
" Define prefix dictionary
let g:lmap =  {}

" Second level dictionaries:
let g:lmap.f = { 'name' : 'File Menu' }
let g:lmap.o = { 'name' : 'Open Stuff' }
"}}}
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
"#       Jedi-vim
"=====================================================
" <leader>r comflict! Я использую вызов :Files для папка с VIMRC
" Deactivate it here.
let g:jedi#rename_command="<Nop>"   " Она и так у меня не работала. Моргала и всё


"=====================================================
"#       Gundo
"=====================================================
if has('python3')
    let g:gundo_prefer_python3 = 1
endif

"=====================================================
"" fzf
"=====================================================
" Вот с этой строчкой не работает поиск файлов!!!
" let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

"=====================================================
"#       snippets
"=====================================================
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

"c-expand mnemonic
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"
" Пока не уверен, что мне нужна TAB
" let g:UltiSnipsJumpForwardTrigger = '<TAB>'
" let g:UltiSnipsJumpBackwardTrigger = '<S-TAB>'
"Это вообще 'валяется' на будущее. Возможно. 
" let g:coc_snippet_next = '<TAB>'
" let g:coc_snippet_prev = '<S-TAB>'

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
"

"=====================================================
"#       Clap
"=====================================================
let g:clap_theme = 'material_design_dark'  "to guarantee right coloring

"=====================================================
"#       vimwiki   {{{
"=====================================================
" let g:vimwiki_folding='list' "неприлично долго искал собой же созданную проблуму.
"Либо эта переменная, либо уже foldmethod=syntax.
let g:vimwiki_folding='syntax'

"=====================================================
"#       Prettier  {{{
"=====================================================
" <leader>-p - default prettier command
"на нравятся подтормаживания при запуске по F6. Буду "в ручную" гонять.
" autocmd BufWritePre *.jsx,*.js,*.json,*.css,*.scss,*.less,*.graphql Prettier

" forced async
    let g:prettier#exec_cmd_async = 1
" Running before saving async
  let g:prettier#autoformat = 0
""}}
