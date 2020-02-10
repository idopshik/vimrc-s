function! quickmenu#ToggleSpelllang()
    if &spelllang is 'ru'
        set spelllang=en
    else
        set spelllang=ru
    endif
endfunc

" enable cursorline (L) and cmdline help (H)
let g:quickmenu_options = "LH"

" clear all the items
call g:quickmenu#reset()


"# section 1, text starting with "#" represents a section (see the screen capture below)
call g:quickmenu#append('#File Encoding', '')

call g:quickmenu#append('windows-1251', 'e ++enc=cp1251 ++ff=dos', 'set Windows-1251')
call g:quickmenu#append('utf-8', 'e ++enc=utf8', 'set utf-8')
call g:quickmenu#append('koi8-r', "e ++enc=koi8-r", 'set koi8-r encoding')
call g:quickmenu#append('Save as utf-8', 'w ++enc=utf8', ':w ++enc=utf8')
call g:quickmenu#append('cp866', 'e ++enc=cp866 ++ff=dos', 'set cp866')

"# section 2
call g:quickmenu#append('# Misc', '')


call quickmenu#append("Turn paste %{&paste? 'off':'on'}", "set paste!", "enable/disable paste mode (:set paste!)")
call quickmenu#append("Turn spell %{&spell? 'off':'on'}", "set spell!", "enable/disable spell check (:set spell!)")

call quickmenu#append('Spellang toggle', ':call quickmenu#ToggleSpelllang()', 'set spelllang')

call quickmenu#append('Ignore Case %{&ignorecase? "[x]" :"[ ]"}', 'set ignorecase!', 'set ignorecase!')

call g:quickmenu#append('# Calendar', '')
call quickmenu#append('Calendar', 'Calendar', 'show Calendar')

call quickmenu#append('# Terminal', '')
call quickmenu#append('Open Terminal Below', 'belowright term ++rows=10', 'Open terminal below current window')
call quickmenu#append('Open Python Below', 'belowright term ++rows=10 python', 'Open python below current window')


call quickmenu#append('Check: flake8', 'call asclib#lint_flake8("")', 'run flake8 in current document, [e to display error', 'python')
call quickmenu#append('Check: pylint', 'call asclib#lint_pylint("")', 'run pylint in current document, [e to display error', 'python')

call quickmenu#append('# Other', '')
call quickmenu#append('Bracey start', 'Bracey', 'Bracey. to stop call :BraceyStop')
call quickmenu#append('Mimimap', 'Minimap', 'Minimap show   MinimapClose (manually)')

if has('win32') || has('win64') || has('win16') || has('win95')
    call quickmenu#append('Open cmd', 'call menu#WinOpen("cmd")', 'Open cmd.exe in current file directory')
    call quickmenu#append('Open explorer', 'call menu#WinOpen("")', 'Open Windows Explorer in current file directory')
endif

"----------------------------------------------------------------------
"# List of my keybidings I'm learning!
"----------------------------------------------------------------------
call quickmenu#current(1)
call quickmenu#reset()

call quickmenu#append('# keybidings', '')
call quickmenu#append('# % - парнаф скобка', '')
call quickmenu#append('# ls - список буферов', '')
call quickmenu#append('# С-f - редактирование в коммандрой строке', '')
call quickmenu#append('# ds) - delete surrounding', '')
