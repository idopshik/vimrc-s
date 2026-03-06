" plugins_config/shared.vim — Конфигурация плагинов (общая)
" ══════════════════════════════════════════════════════════════════════════════
" ОБНОВЛЕНО: убраны YCM/jedi/syntastic, добавлен coc
" ══════════════════════════════════════════════════════════════════════════════

" === Загружаем конфиг COC ===
" Это главный completion engine
" В начале секции COC:
if exists('g:did_coc_loaded')
    execute 'source ' . g:vim_runtime . '/plugins_config/coc.vim'
endif

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

"=====================================================
"#       Vimspector (Python debugging)
"=====================================================
" НЕ используем встроенные маппинги — они конфликтуют с tagbar!
let g:vimspector_enable_mappings = ''
let g:vimspector_install_gadgets = ['debugpy', 'vscode-cpptools']

" Свои keymaps для debug (без F9!)
nmap <leader>dd <Plug>VimspectorContinue
nmap <leader>ds <Plug>VimspectorStop
nmap <leader>dr <Plug>VimspectorRestart
nmap <leader>dp <Plug>VimspectorPause
nmap <leader>db <Plug>VimspectorToggleBreakpoint
nmap <leader>dB <Plug>VimspectorToggleConditionalBreakpoint
nmap <leader>df <Plug>VimspectorAddFunctionBreakpoint
nmap <leader>dc <Plug>VimspectorRunToCursor
nmap <leader>do <Plug>VimspectorStepOver
nmap <leader>di <Plug>VimspectorStepInto
nmap <leader>dO <Plug>VimspectorStepOut
nmap <leader>dq :VimspectorReset<CR>
nmap <leader>dC :call vimspector#ClearBreakpoints()<CR>

"=====================================================
"#       Startify
"=====================================================
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Recent']            },
      \ { 'type': 'dir',       'header': ['   Current Dir '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ ]

let g:startify_bookmarks = [
      \ { 'v': g:vim_runtime . '/sammeln.vim' },
      \ { 'k': g:vim_runtime . '/core/keymap.vim' },
      \ ]


" ======================================================
" Startify + cowsay + vimtricks.com
" ======================================================
"
" Шаг 1. Создай ~/.vim/vimtricks.txt — вручную или скриптом.
"   Формат: блоки через пустую строку, каждая строка блока = строка цитаты.
"
"   Vim Calculator
"   Perform calculations without leaving Vim.
"
"   Vim File Templates
"   Use built-in skeleton files, no plugins needed.
"
" Шаг 2. Добавь в .vimrc один из вариантов ниже.

" ── Вариант 1: через g:startify_custom_header_quotes (рекомендую) ──
" Startify сам выбирает случайную цитату и рисует cowsay.
" Никаких кастомных функций не нужно.

let s:tips_file = expand('~/.vim/vimtricks.txt')

function! s:load_vimtricks() abort
    if !filereadable(s:tips_file)
        return []
    endif
    let l:lines = readfile(s:tips_file)
    let l:tips = []
    let l:current = []
    for l:line in l:lines
        if l:line =~ '^\s*$'
            if !empty(l:current)
                call add(l:tips, l:current)
                let l:current = []
            endif
        else
            call add(l:current, l:line)
        endif
    endfor
    if !empty(l:current)
        call add(l:tips, l:current)
    endif
    return l:tips
endfunction

let s:vimtricks = s:load_vimtricks()
if !empty(s:vimtricks)
    let g:startify_custom_header_quotes = s:vimtricks
endif

" ── Вариант 2: без cowsay, просто текст в рамке ──
" Раскомментируй это вместо Варианта 1, если хочешь boxed без коровы.
"
" let g:startify_custom_header =
"       \ 'startify#pad(startify#fortune#boxed(g:startify_custom_header_quotes))'

"=====================================================
"#       Airline
"=====================================================
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#ale#enabled = 0  " Отключаем ALE для Python

"=====================================================
"#       NERDTree
"=====================================================
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.git$', 'node_modules', '\.DS_Store', '\.egg-info$', '\.eggs$', 'venv', '\.venv']
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
"#       ALE (только для НЕ-Python файлов)
"=====================================================
" Для Python используем ruff через coc-pyright
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'go': ['golint', 'go vet'],
\   'c': ['clangd'],
\   'cpp': ['clangd'],
\}

" Отключаем ALE для Python (coc-pyright + ruff лучше)
let g:ale_linters_ignore = {'python': ['flake8', 'pylint', 'mypy']}
let g:ale_disable_lsp = 1  " Используем coc для LSP

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'json': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\}

let g:ale_fix_on_save = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

"=====================================================
"#       FZF
"=====================================================
let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_mru_relative = 1

"=====================================================
"#       Tagbar
"=====================================================
let g:tagbar_width = 30
let g:tagbar_autoclose = 0
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0

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
let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'tagbar', 'startify']

"=====================================================
"#       vim-jsx-pretty
"=====================================================
let g:vim_jsx_pretty_colorful_config = 1

"=====================================================
"#       UltiSnips
"=====================================================
let g:UltiSnipsExpandTrigger = "<C-j>"  " Изменено чтобы не конфликтовать с coc
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
let g:UltiSnipsEditSplit = "vertical"

"=====================================================
"#       Rooter
"=====================================================
let g:rooter_silent_chdir = 1
let g:rooter_patterns = ['.git', 'Makefile', 'package.json', 'setup.py', 'pyproject.toml', 'go.mod']

"=====================================================
"#       Python syntax
"=====================================================
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0

"=====================================================
"#       Markdown Preview
"=====================================================
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_browser = ''

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
