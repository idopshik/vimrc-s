" platform/windows_latex.vim — VimTeX конфиг для Vim на Windows
" ══════════════════════════════════════════════════════════════════════════════
" Только для Vim (не Neovim), только для .tex файлов
" Без COC, без ALE, без treesitter — чистый старт
" ══════════════════════════════════════════════════════════════════════════════

" Этот файл подключается из platform/windows.vim через:
"   autocmd FileType tex source <этот файл>
" ИЛИ добавь в sammeln.vim после этапа 3:
"   if g:is_win && g:is_vim
"       call s:SourceIfExists('platform/windows_latex.vim')
"   endif

" ══════════════════════════════════════════════════════════════════════════════
" 1. ОТКЛЮЧАЕМ ВСЕХ МЕШАЮЩИХ ДЛЯ .tex
" ══════════════════════════════════════════════════════════════════════════════

augroup LatexCleanEnv
    autocmd!

    " Отключаем COC для tex — он там не нужен и мешает
    autocmd FileType tex let b:coc_enabled = 0

    " Отключаем ALE для tex
    autocmd FileType tex let b:ale_enabled = 0

    " Отключаем indentLine — он конфликтует с conceal в tex
    autocmd FileType tex let g:indentLine_enabled = 0

    " Никакого conceallevel — именно это вызывало "прыжки" текста
    autocmd FileType tex setlocal conceallevel=0

    " Отключаем синтаксический conceal самого vimtex
    autocmd FileType tex let b:vimtex_syntax_conceal_disable = 1

augroup END

" ══════════════════════════════════════════════════════════════════════════════
" 2. VIMTEX — ОСНОВНЫЕ НАСТРОЙКИ
" ══════════════════════════════════════════════════════════════════════════════

" Движок — lualatex
let g:vimtex_compiler_method = 'latexmk'

let g:vimtex_compiler_latexmk = {
    \ 'executable' : 'latexmk',
    \ 'build_dir'  : 'build',
    \ 'options'    : [
    \   '-lualatex',
    \   '-interaction=nonstopmode',
    \   '-synctex=1',
    \   '-shell-escape',
    \   '-file-line-error',
    \ ],
    \ 'continuous' : 1,
    \}

" Автокомпиляция при старте (\ll запускает и остаётся работать в фоне)
" continuous=1 выше означает что latexmk следит за файлом и перекомпилирует
" сам при каждом сохранении — это и есть "автокомпиляция"

" ══════════════════════════════════════════════════════════════════════════════
" 3. ПРОСМОТРЩИК PDF — SumatraPDF + BACKSEARCH
" ══════════════════════════════════════════════════════════════════════════════

" Метод просмотра
let g:vimtex_view_method = 'general'
let g:vimtex_view_general_viewer = 'C:\Progs\Sumatra\SumatraPDF-3.6.1-64.exe'

" Опции для forward search (из Vim → PDF)
" и для того чтобы SumatraPDF не открывал новое окно каждый раз
let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'

" ──────────────────────────────────────────────────────────────────────────────
" BACKSEARCH: из SumatraPDF → Vim
" ──────────────────────────────────────────────────────────────────────────────
"
" Vim должен запускаться как сервер чтобы SumatraPDF мог его найти.
" Запускай Vim так:
"   vim --servername LATEX file.tex
" Или добавь алиас/батник.
"
" В SumatraPDF: Настройки → Дополнительные настройки → найди ReverseSearchCmdLine
" и замени на:
"
"   "C:\Program Files\Vim\vim91\vim.exe" --servername LATEX --remote-silent +%l "%f"
"
" (путь к vim.exe подправь под свой)
"
" Проверить что сервер запущен: :echo v:servername
" Если пусто — vim запущен без --servername, backsearch не будет работать.
" ──────────────────────────────────────────────────────────────────────────────

" ══════════════════════════════════════════════════════════════════════════════
" 4. ОТКЛЮЧАЕМ НЕНУЖНЫЕ ЧАСТИ VIMTEX
" ══════════════════════════════════════════════════════════════════════════════

" Отключаем встроенный indent vimtex — он иногда ломает отступы
let g:vimtex_indent_enabled = 0

" Отключаем imaps (insert mode mappings типа `a → α) — они мешают
" Раскомментируй если хочешь их оставить
let g:vimtex_imaps_enabled = 0

" Отключаем syntax vimtex полностью — используем стандартный vim syntax
" Это убирает все "прыжки" связанные с vimtex syntax engine
" ВНИМАНИЕ: подсветка станет проще, но зато стабильно
let g:vimtex_syntax_enabled = 0

" Не открывать quickfix автоматически при каждой компиляции
" (только если есть ошибки)
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode = 2

" ══════════════════════════════════════════════════════════════════════════════
" 5. УДОБНЫЕ НАСТРОЙКИ ДЛЯ РЕДАКТИРОВАНИЯ TEX
" ══════════════════════════════════════════════════════════════════════════════

augroup LatexEditing
    autocmd!

    " Перенос строк — в tex удобнее работать с wrap
    autocmd FileType tex setlocal wrap
    autocmd FileType tex setlocal linebreak
    autocmd FileType tex setlocal textwidth=0

    " Spell по умолчанию — раскомментируй если нужно
    " autocmd FileType tex setlocal spell spelllang=ru,en

    " j/k по визуальным строкам (удобно при wrap)
    autocmd FileType tex nnoremap <buffer> j gj
    autocmd FileType tex nnoremap <buffer> k gk

augroup END

" ══════════════════════════════════════════════════════════════════════════════
" 6. KEYMAPS (только для .tex буферов)
" ══════════════════════════════════════════════════════════════════════════════
" Стандартные vimtex keymaps (начинаются с \):
"   \ll  — запустить/остановить компиляцию (continuous mode)
"   \lv  — forward search (перейти к месту в PDF)
"   \le  — открыть лог с ошибками
"   \lc  — очистить build файлы
"   \lk  — остановить компиляцию
"   \li  — информация о проекте (vimtex info)
"
" Добавляем только то, чего не хватает:

augroup LatexKeymaps
    autocmd!
    " F5 — компилировать (альтернатива \ll)
    autocmd FileType tex nnoremap <buffer> <F5> :VimtexCompile<CR>
    " F6 — forward search
    autocmd FileType tex nnoremap <buffer> <F6> :VimtexView<CR>
    " F8 — показать ошибки
    autocmd FileType tex nnoremap <buffer> <F8> :VimtexErrors<CR>
augroup END

" ══════════════════════════════════════════════════════════════════════════════
" ПОДКЛЮЧЕНИЕ ПЛАГИНА
" ══════════════════════════════════════════════════════════════════════════════
" vimtex должен быть в plugins/shared.vim (работает и в Vim и в Neovim):
"
"   Plug 'lervag/vimtex'
"
" Сейчас он только в plugins/nvim_only.vim — перенеси в shared.vim
" чтобы он грузился и в Vim тоже!
