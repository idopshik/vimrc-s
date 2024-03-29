function! quickmenu#ToggleSpelllang()
    if &spelllang is 'ru'
        set spelllang=en
    else
        set spelllang=ru
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
" enable cursorline (L) and cmdline help (H)
let g:quickmenu_options = "LH"

" Replace the origin title of `QuickMenu X.X.X`
call g:quickmenu#header('<leader-2>  menu#2')

" clear all the items
call g:quickmenu#reset()



"# section 1, text starting with "#" represents a section (see the screen capture below)
call g:quickmenu#append('#File Encoding', '')

call g:quickmenu#append('windows-1251', 'e ++enc=cp1251 ++ff=dos', 'set Windows-1251')
call g:quickmenu#append('utf-8', 'e ++enc=utf8', 'set utf-8')
call g:quickmenu#append('koi8-r', "e ++enc=koi8-r", 'set koi8-r encoding')
call g:quickmenu#append('save as utf-8', 'w ++enc=utf8', ':w ++enc=utf8')
call g:quickmenu#append('cp866', 'e ++enc=cp866 ++ff=dos', 'set cp866')

"# section 2
call g:quickmenu#append('# Misc', '')

call quickmenu#append("Ru Spell", "setlocal spelllang=ru spell", "set local Russian spelling")
call quickmenu#append("turn paste %{&paste? 'off':'on'}", "set paste!", "enable/disable paste mode (:set paste!)")
call quickmenu#append("turn spell %{&spell? 'off':'on'}", "set spell!", "enable/disable spell check (:set spell!)")

call quickmenu#append('spellang toggle', ':call quickmenu#ToggleSpelllang()', 'set spelllang')

call quickmenu#append('ignore case %{&ignorecase? "[x]" :"[ ]"}', 'set ignorecase!', 'set ignorecase!')

"preview это commma-separated-list. Вот как проверить вхождение в этот лист, я найти и понять не смог.
call quickmenu#append('preview enable', 'set completeopt+=preview', 'set completeopt+=preview')
call quickmenu#append('autoclose preview', 'autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif', ' autocommand for InsertLeave')

call quickmenu#append('deoplete#enable', 'call deoplete#enable()', 'call deoplete#enable()')
call quickmenu#append('deoplete#disable', 'call deoplete#disable()', 'call deoplete#disable()')
call quickmenu#append('CocEnable', 'CocEnable', 'CocEnable')
call quickmenu#append('CocDisable', 'CocDisable', 'CocDisable')

call quickmenu#append('# JavaScript', '', '', 'javascript')
call quickmenu#append('conceallevel %{&conceallevel? "[x]" :"[ ]"}', ':call quickmenu#ToggleConceallevel()', 'for js filetype vim-javascript could show glypths', 'javascript')
" call quickmenu#append('foldcolumn %{&foldcolumn? "[x]" :"[ ]"}', ':call quickmenu#ToggleFoldcolumn()', 'foldcolumn - show fold column in gutter', 'javascript')
call quickmenu#append('foldcolumn %{&foldcolumn? "[x]" :"[ ]"}', ':call quickmenu#ToggleFoldcolumn()', 'foldcolumn - show fold column in gutter')
call quickmenu#append('ALEToggle', 'ALEToggle', 'run ALEToggle to stop linters', 'python')
"Не могу экранировать пробел. Не помогает // /  \  Идеи кончились. 
"call quickmenu#append('jedi %{&echo_g:jedi#completions_enabled "[x]" :"[ ]"}', ':let g:jedi#completions_enabled = 0', 'toggle jedi completion', 'python')
"TODO надо это отладить, что-то дополняет всё равно.
call quickmenu#append('jedi completion off ', ':let g:jedi#completions_enabled = 0', 'turn off jedi completion', 'python')

call quickmenu#append('# Other', '')
call quickmenu#append('Bracey start', 'Bracey', 'Bracey. to stop call :BraceyStop', 'html')
call quickmenu#append('Livedown server toggle', 'LivedownToggle', 'Open md in browser/stop server', 'markdown')
call quickmenu#append('raibow brackets', 'RainbowToggle', 'Colurful brackets toggle. :RainbowToggle')
" call quickmenu#append('Mimimap', 'Minimap', 'Minimap show   MinimapClose (manually)')

if has('win32') || has('win64') || has('win16') || has('win95')
    call quickmenu#append('Open cmd', 'call menu#WinOpen("cmd")', 'Open cmd.exe in current file directory')
    call quickmenu#append('Open explorer', 'call menu#WinOpen("")', 'Open Windows Explorer in current file directory')
endif

"----------------------------------------------------------------------
"# List of my keybidings I'm learning!
"----------------------------------------------------------------------
call quickmenu#current(1)
call quickmenu#reset()


"----------------------------------------------------------------------
"# Some other raraly used things. And probable useless.
"----------------------------------------------------------------------
call quickmenu#append('Calendar', 'Calendar', 'show Calendar')

call g:quickmenu#append('# Vim "strange"', '')
call quickmenu#append('Clean undo/swap dirs!', '!rm -f -r ~/.vim/undodir/* ~/.vim/swapfiles/*', 'There was case that "strange" bahavior was illiminated only after this!')

call quickmenu#append('# Terminal', '')
call quickmenu#append('Open Terminal Below', 'belowright term ++rows=10', 'Open terminal below current window')
call quickmenu#append('Open Python Below', 'belowright term ++rows=10 ipython', 'Open python below current window')

"----------------------------------------------------------------------
"# Some info probably useless too
"----------------------------------------------------------------------
call quickmenu#append('# Keybidings I"m learning', '')
call quickmenu#append('# С-f - редактирование в коммандрой строке', '')
