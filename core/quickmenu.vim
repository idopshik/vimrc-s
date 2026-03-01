" quickmenu.vim — Боковое меню
" ══════════════════════════════════════════════════════════════════════════════
" <leader>m — основное меню
" <leader>2 — debug/terminal меню
" ══════════════════════════════════════════════════════════════════════════════

" === Вспомогательные функции ===
function! quickmenu#ToggleSpelllang()
    if &spelllang is 'ru'
        set spelllang=en
        echo "Spell: EN"
    else
        set spelllang=ru
        echo "Spell: RU"
    endif
endfunc

function! quickmenu#ToggleConceallevel()
    if &conceallevel > 0
        set conceallevel=0
    else
        set conceallevel=1
    endif
endfunc

function! quickmenu#ToggleFoldcolumn()
    if &foldcolumn > 0
        set foldcolumn=0
    else
        set foldcolumn=1
    endif
endfunc

" Опции меню: L=cursorline, H=cmdline help
let g:quickmenu_options = "LH"

" ══════════════════════════════════════════════════════════════════════════════
" МЕНЮ 0 — Основное (<leader>m)
" ══════════════════════════════════════════════════════════════════════════════
call g:quickmenu#current(0)
call g:quickmenu#reset()
call g:quickmenu#header('<leader>m  Main Menu')

" --- Кодировки (как было) ---
call g:quickmenu#append('# File Encoding', '')
call g:quickmenu#append('windows-1251', 'e ++enc=cp1251 ++ff=dos', 'set Windows-1251')
call g:quickmenu#append('utf-8', 'e ++enc=utf8', 'set utf-8')
call g:quickmenu#append('koi8-r', 'e ++enc=koi8-r', 'set koi8-r encoding')
call g:quickmenu#append('save as utf-8', 'w ++enc=utf8', ':w ++enc=utf8')
call g:quickmenu#append('cp866', 'e ++enc=cp866 ++ff=dos', 'set cp866')

" --- COC (вместо ALE/deoplete) ---
call g:quickmenu#append('# COC', '')
call g:quickmenu#append('Diagnostics OFF', 'CocDisable', 'Выключить ВСЕ — линтер, подсказки, всё')
call g:quickmenu#append('Diagnostics ON', 'CocEnable', 'Включить обратно')
call g:quickmenu#append('Restart COC', 'CocRestart', 'Перезапустить если глючит')
call g:quickmenu#append('Format file', 'call CocActionAsync("format")', 'Форматировать (как F4)')
call g:quickmenu#append('Organize Imports', 'OR', 'Сортировка импортов Python')
call g:quickmenu#append('Show errors list', 'CocList diagnostics', 'Все ошибки в списке')
call g:quickmenu#append('COC Extensions', 'CocList extensions', 'Список расширений')
call g:quickmenu#append('COC Config', 'CocConfig', 'Открыть coc-settings.json')

" --- Misc (как было) ---
call g:quickmenu#append('# Misc', '')
call g:quickmenu#append('Ru Spell', 'setlocal spelllang=ru spell', 'Russian spelling')
call g:quickmenu#append('turn paste %{&paste? "off":"on"}', 'set paste!', 'toggle paste mode')
call g:quickmenu#append('turn spell %{&spell? "off":"on"}', 'set spell!', 'toggle spell check')
call g:quickmenu#append('spelllang toggle', ':call quickmenu#ToggleSpelllang()', 'RU/EN spell')
call g:quickmenu#append('ignore case %{&ignorecase? "[x]":"[ ]"}', 'set ignorecase!', 'toggle ignorecase')
call g:quickmenu#append('foldcolumn %{&foldcolumn? "[x]":"[ ]"}', ':call quickmenu#ToggleFoldcolumn()', 'fold column in gutter')
call g:quickmenu#append('conceallevel %{&conceallevel? "[x]":"[ ]"}', ':call quickmenu#ToggleConceallevel()', 'toggle conceallevel')

" --- Other ---
call g:quickmenu#append('# Other', '')
call g:quickmenu#append('rainbow brackets', 'RainbowToggle', 'Colorful brackets toggle')
if g:is_win
    call g:quickmenu#append('Open cmd', '!start cmd', 'cmd.exe в текущей директории')
    call g:quickmenu#append('Open explorer', '!start explorer .', 'Explorer здесь')
endif

" --- Sessions ---
call g:quickmenu#append('# Sessions', '')
call g:quickmenu#append('Save Session', 'Obsession', 'Start tracking session')
call g:quickmenu#append('Stop Session', 'Obsession!', 'Stop tracking')
call g:quickmenu#append('Load Session', 'source Session.vim', 'Load Session.vim')

" ══════════════════════════════════════════════════════════════════════════════
" МЕНЮ 1 — Debug/Terminal (<leader>2)
" ══════════════════════════════════════════════════════════════════════════════
call g:quickmenu#current(1)
call g:quickmenu#reset()
call g:quickmenu#header('<leader>2  Debug & Tools')

" --- Debug (Vimspector) ---
call g:quickmenu#append('# Debug (Vimspector)', '')
call g:quickmenu#append('Start/Continue  ,dd', 'call vimspector#Continue()', 'F5 alternative')
call g:quickmenu#append('Breakpoint      ,db', 'call vimspector#ToggleBreakpoint()', 'Toggle breakpoint')
call g:quickmenu#append('Step Over       ,do', 'call vimspector#StepOver()', 'Step over')
call g:quickmenu#append('Step Into       ,di', 'call vimspector#StepInto()', 'Step into')
call g:quickmenu#append('Step Out        ,dO', 'call vimspector#StepOut()', 'Step out')
call g:quickmenu#append('Stop            ,ds', 'call vimspector#Stop()', 'Stop debugging')
call g:quickmenu#append('Reset           ,dq', 'VimspectorReset', 'Close debug UI')
call g:quickmenu#append('Clear All BP    ,dC', 'call vimspector#ClearBreakpoints()', 'Remove all breakpoints')
call g:quickmenu#append('Install debugpy', 'VimspectorInstall debugpy', 'Install Python debugger')

" --- Terminal ---
call g:quickmenu#append('# Terminal', '')
if g:is_win
    call g:quickmenu#append('Terminal Below', 'belowright split | terminal', 'Open terminal below')
    call g:quickmenu#append('Python Below', 'belowright split | terminal python', 'Open python below')
    call g:quickmenu#append('PowerShell', 'terminal pwsh', 'Open PowerShell')
else
    call g:quickmenu#append('Terminal Below', 'belowright term ++rows=10', 'Open terminal below')
    call g:quickmenu#append('Python Below', 'belowright term ++rows=10 ipython', 'Open ipython below')
endif

" --- Vim Cleanup ---
call g:quickmenu#append('# Vim "strange"', '')
if g:is_win
    call g:quickmenu#append('Clean undo/swap!', '!del /q %USERPROFILE%\\_vim\\undodir\\* %USERPROFILE%\\_vim\\swapfiles\\*', 'Delete undo/swap files')
else
    call g:quickmenu#append('Clean undo/swap!', '!rm -f -r ~/.vim/undodir/* ~/.vim/swapfiles/*', 'Delete undo/swap files')
endif
call g:quickmenu#append('Reload vimrc', 'source $MYVIMRC', 'Reload config')

" --- Other ---
call g:quickmenu#append('# Other', '')
call g:quickmenu#append('Calendar', 'Calendar', 'Show calendar')

" --- Keybindings reminder ---
call g:quickmenu#append('# Keybindings reminder', '')
call g:quickmenu#append('# C-f — edit in cmdline', '')
call g:quickmenu#append('# gd — go to definition', '')
call g:quickmenu#append('# gr — find references', '')
call g:quickmenu#append('# K  — show documentation', '')

" ══════════════════════════════════════════════════════════════════════════════
" Keymaps (как было)
" ══════════════════════════════════════════════════════════════════════════════
noremap <silent><Leader>m :call quickmenu#toggle(0)<cr>
noremap <silent><Leader>2 :call quickmenu#toggle(1)<cr>
