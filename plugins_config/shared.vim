" plugins_config/shared.vim — Конфигурация плагинов (общая)
" ══════════════════════════════════════════════════════════════════════════════

"=====================================================
"#       Multi-cursor
"=====================================================
let g:VM_maps = {}
let g:VM_maps['Find Under']                  = '<C-y>'
let g:VM_maps['Find Subword Under']          = '<C-y>'
let g:VM_maps["Select All"]                  = '\\A' 
let g:VM_maps["Start Regex Search"]          = '\\/'
let g:VM_maps["Add Cursor Down"]             = '<C-Down>'
let g:VM_maps["Add Cursor Up"]               = '<C-Up>'
let g:VM_maps["Add Cursor At Pos"]           = '\\\'
let g:VM_maps["Visual Regex"]                = '\\/'
let g:VM_maps["Visual All"]                  = '\\A' 
let g:VM_maps["Visual Add"]                  = '\\a'
let g:VM_maps["Visual Find"]                 = '\\f'
let g:VM_maps["Visual Cursors"]              = '\\c'

"=====================================================
"#       Vimspector
"=====================================================
let g:vimspector_install_gadgets = ['debugpy']

nnoremap <F10> <Plug>VimspectorLaunch
nnoremap <F11> :call vimspector#Reset()<CR>
autocmd FileType python map <buffer> <F12> <Plug>VimspectorContinue

nmap <Leader>db <Plug>VimspectorBreakpoints
nmap <Leader>dt <Plug>VimspectorToggleBreakpoint
nmap <Leader>dc :call vimspector#ClearBreakpoints()<CR>

let s:mapped = {}

function! s:OnJumpToFrame() abort
    if has_key(s:mapped, string(bufnr()))
        return
    endif
    nmap <LocalLeader>t :call vimspector#ToggleBreakpoint()<CR>
    nmap <LocalLeader>T :call vimspector#ClearBreakpoints()<CR>
    nmap <silent> <buffer> <LocalLeader>o <Plug>VimspectorStepOver
    nmap <silent> <buffer> <LocalLeader>n <Plug>VimspectorStepInto
    nmap <silent> <buffer> <LocalLeader>a <Plug>VimspectorStepOut
    nmap <silent> <buffer> <LocalLeader>c <Plug>VimspectorContinue
    let s:mapped[string(bufnr())] = {'modifiable': &modifiable}
endfunction

augroup VimspectorCustomMappings
    autocmd!
    autocmd User VimspectorJumpedToFrame call s:OnJumpToFrame()
augroup END

"=====================================================
"#       Airline
"=====================================================
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = '⨉'
let airline#extensions#coc#warning_symbol = '⚠'

"=====================================================
"#       NERDTree
"=====================================================
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.git$', 'node_modules', '\.DS_Store']
let g:NERDTreeWinSize = 30

" Закрыть vim если NERDTree единственное окно
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"=====================================================
"#       NERDCommenter
"=====================================================
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

"=====================================================
"#       ALE
"=====================================================
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'go': ['golint', 'go vet'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\   'javascript': ['prettier', 'eslint'],
\   'json': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\}

let g:ale_fix_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"=====================================================
"#       Syntastic
"=====================================================
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']

"=====================================================
"#       FZF
"=====================================================
let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" FZF MRU
let g:fzf_mru_relative = 1

"=====================================================
"#       Tagbar
"=====================================================
let g:tagbar_width = 30
let g:tagbar_autoclose = 0
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0

"=====================================================
"#       YouCompleteMe
"=====================================================
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = -1
let g:ycm_filetype_whitelist = {'python': 1, 'c': 1, 'cpp': 1, 'h': 1}
let g:ycm_filetype_blacklist = {'go': 1}
let g:ycm_auto_hover = ''

map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"=====================================================
"#       Jedi-vim
"=====================================================
let g:jedi#completions_enabled = 0  " Используем YCM
let g:jedi#goto_command = "<leader>jd"
let g:jedi#goto_assignments_command = "<leader>ja"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>ju"
let g:jedi#rename_command = "<Nop>"
let g:jedi#show_call_signatures = 1

"=====================================================
"#       vim-go
"=====================================================
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

"=====================================================
"#       Git messenger
"=====================================================
let g:git_messenger_close_on_cursor_moved = v:false
let g:git_messenger_always_into_popup = v:true

"=====================================================
"#       Gitgutter
"=====================================================
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap <Leader>hs <Plug>(GitGutterStageHunk)
nmap <Leader>hu <Plug>(GitGutterUndoHunk)
nmap <Leader>hp <Plug>(GitGutterPreviewHunk)

"=====================================================
"#       Rainbow parentheses
"=====================================================
let g:rainbow_active = 1

"=====================================================
"#       IndentLine
"=====================================================
let g:indentLine_char = '│'
let g:indentLine_enabled = 1
let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'tagbar']

"=====================================================
"#       vim-jsx-pretty
"=====================================================
let g:vim_jsx_pretty_colorful_config = 1

"=====================================================
"#       UltiSnips
"=====================================================
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit = "vertical"

"=====================================================
"#       Rooter
"=====================================================
let g:rooter_silent_chdir = 1
let g:rooter_patterns = ['.git', 'Makefile', 'package.json', 'setup.py', 'go.mod']

"=====================================================
"#       AsyncRun
"=====================================================
" C language mappings
autocmd FileType c map <buffer> <F5> <Esc>:w<CR>:AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"<cr>
autocmd FileType c map <buffer> <F6> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"<cr>
autocmd FileType c map <buffer> <F8> <Esc>:w<CR>:!clear<CR>:!gcc % -o %< && ./%<<CR>

nnoremap <F12> :call asyncrun#quickfix_toggle(6)<cr>

"=====================================================
"#       Emmet
"=====================================================
let g:user_emmet_leader_key = '<C-Z>'

"=====================================================
"#       Markdown
"=====================================================
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

"=====================================================
"#       Completion overlap resolving
"=====================================================
" CoC/YCM overlap
autocmd BufNew,BufEnter *.py,*.cpp,*.c,*.h silent! CocDisable
autocmd BufLeave *.py,*.cpp,*.c,*.h silent! CocEnable

" CoC/deoplete overlap
autocmd BufNew,BufEnter *.go silent! execute "call deoplete#enable() | CocDisable"
autocmd BufLeave *.go silent! execute "call deoplete#disable()"
