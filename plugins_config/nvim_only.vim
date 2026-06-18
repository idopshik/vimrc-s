" plugins_config/nvim_only.vim — Конфигурация для Neovim-specific плагинов
" ══════════════════════════════════════════════════════════════════════════


" Терминал: сразу в insert mode
augroup NvimTerminal
    autocmd!
    autocmd TermOpen * startinsert
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" Подсветка yanked текста
augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})
augroup END
" === .tex: отключаем COC/ALE/indentLine ===
augroup LatexCleanEnvNvim
    autocmd!
    autocmd FileType tex let b:coc_enabled = 0
    autocmd FileType tex let b:ale_enabled = 0
    autocmd FileType tex let g:indentLine_enabled = 0
    autocmd FileType tex setlocal conceallevel=0
augroup END


" ══════════════════════════════════════════════════════════════════════════════
" VimTeX (LaTeX) — компиляция через latexmk, просмотр в SumatraPDF (Windows)
" ══════════════════════════════════════════════════════════════════════════════

if has('nvim')

   "

    " Отключаем conceal для TeX-файлов

    let g:vimtex_syntax_conceal = {
        \ 'accents': 0,
        \ 'cites': 0,
        \ 'fancy': 0,
        \ 'greek': 0,
        \ 'ligatures': 0,
        \ 'math_bounds': 0,
        \ 'math_delimiters': 0,
        \ 'math_symbols': 0,
        \ 'sections': 0,
        \ 'styles': 0,
    \}
    highlight Conceal guifg=#fabd2f guibg=NONE gui=bold

    set conceallevel=0   

    autocmd ColorScheme * highlight texDelim guifg=#fabd2f guibg=NONE gui=bold
    autocmd ColorScheme * highlight texMathSymbol guifg=#fabd2f guibg=NONE gui=bold
    highlight texCmdItem guifg=#fabd2f guibg=NONE gui=bold


    for group in ['texAccent', 'texMathSymbol', 'texMathZone', 'texGreek', 'Conceal', 'texDelim', 'texMathOper', 'texTypeStyle', 'texStatement']
      execute 'highlight' group 'guifg=#fabd2f guibg=NONE gui=bold'
    endfor
   
    
    " Или глобально через autocmd
    " autocmd FileType tex setlocal conceallevel=0
    "
    " bug подсветки
    " g:vimtex_syntax_enabled = 1

    " Метод компиляции: latexmk (лучший вариант)
    let g:vimtex_compiler_method = 'latexmk'
    
    " Настройки latexmk: складывать временные файлы в build/
let g:vimtex_compiler_latexmk = {
    \ 'executable' : 'latexmk',
    \ 'build_dir'  : 'build',
    \ 'continuous' : 1,
    \ 'options' : [
    \   '-lualatex',
    \   '-interaction=nonstopmode',
    \   '-synctex=1',
    \   '-shell-escape',
    \   '-output-directory=build',
    \ ],
\}

    " Вместо (или дополнительно к) build_dir в dict:
    let g:vimtex_compiler_build_dir = 'build'



    " Просмотрщик PDF для Windows (SumatraPDF)
    " Укажите полный путь, если SumatraPDF не в PATH
    if g:is_win
        " Windows: SumatraPDF
        let g:vimtex_view_general_viewer = 'C:/Users/belousov/Progs/sumatra/SumatraPDF-3.6.1-64.exe'
        let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
    else

        " Linux: используем системный просмотрщик по умолчанию (xdg-open)
        let g:vimtex_view_method = 'zathura'
    endif

    
    " Если SumatraPDF не находится автоматически, укажите явно:
    " let g:vimtex_view_general_viewer = 'C:/Program Files/SumatraPDF/SumatraPDF.exe'
    
    " Для обратного поиска из SumatraPDF в Neovim:
    " Настройте SumatraPDF: Настройки → Дополнительные настройки → ReverseSearchCmdLine
    " Пример строки:
    " ReverseSearchCmdLine = "C:\\Program Files\\Neovim\\bin\\nvim.exe" --headless -c "VimtexInverseSearch %l '%f'"
    
    " Опционально: быстрые привязки (по умолчанию \ll, \lv и т.д. работают)
    " Не переопределяйте \ll, \lv, если не хотите менять стандартное поведение
    " Не открывать quickfix при наличии только предупреждений

    let g:vimtex_quickfix_open_on_warning = 0

    " Фильтровать строки, содержащие эти паттерны (не попадают в quickfix)
    let g:vimtex_quickfix_ignore_filters = [
        \ 'Underfull \\hbox',
        \ 'Overfull \\hbox',
        \ 'Overfull \\vbox',
        \ 'Package hyperref Warning',
        \ 'Token not allowed',
        \ 'badness',
        \ 'duplicate destination',
    \]

    autocmd FileType tex setlocal conceallevel=0
    " g:vimtex_syntax_conceal_default removed (deprecated in newer VimTeX)

endif




" Настраиваем формат вывода ошибок для quickfix-списка
set errorformat=%E!\ LaTeX\ %trror:\ %m,
      \%+WLaTeX\ %.%#Warning:\ %.%#line\ %l%.%#,
      \%+WPackage\ hyperref\ Warning:%.%#,
      \%+WPackage\ %.%#\ Warning:%.%#,
      \%+WUnderfull\ %.%#,
      \%+WOverfull\ %.%#,
      \%+WLaTeX\ %.%#Warning:%.%#,
      \%+W\ %.%#\ at\ lines\ %l--%*\\d,
      \%+W\ \ at\ lines\ %l--%*\\d,
      \%+W\ at\ lines\ %l--%*\\d,
      \%-C\ \ %\\&\\&,
      \%-C%.%#



" let g:git_messenger_no_default_mappings = 1
" let g:git_messenger_always_into_popup = 1
"
"

"" === Markdown Preview (iamcco) ===
let g:mkdp_auto_start = 0          " не открывать автоматически
let g:mkdp_auto_close = 1          " закрывать при выходе из буфера
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''            " если надо указать путь к браузеру
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mermaid': {
        \ 'start': '```mermaid',
        \ 'end': '```'
    \ },
    \ 'toc': {
        \ 'enable': 1
    \ }
\}
