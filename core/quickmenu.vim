" core/quickmenu.vim — Quickmenu конфигурация
" ══════════════════════════════════════════════════════════════════════════════

" Настройки quickmenu
let g:quickmenu_options = "HL"

" === Меню 0 (основное) ===
call g:quickmenu#reset()

call g:quickmenu#append('# Navigation', '')
call g:quickmenu#append('NERDTree Toggle', 'NERDTreeToggle', 'Toggle file tree')
call g:quickmenu#append('Tagbar Toggle', 'TagbarToggle', 'Toggle tagbar')
call g:quickmenu#append('Undotree Toggle', 'UndotreeToggle', 'Toggle undo tree')

call g:quickmenu#append('# Search', '')
call g:quickmenu#append('Files (FZF)', 'Files', 'Search files')
call g:quickmenu#append('Buffers', 'Buffers', 'Search buffers')
call g:quickmenu#append('MRU Files', 'FZFMru', 'Most recently used files')
call g:quickmenu#append('Rg Search', 'Rg', 'Ripgrep search')

call g:quickmenu#append('# Git', '')
call g:quickmenu#append('Git Status', 'Git', 'Fugitive status')
call g:quickmenu#append('Git Log', 'GV', 'Git log graph')
call g:quickmenu#append('Git Blame', 'Git blame', 'Git blame')
call g:quickmenu#append('Git Diff', 'Gdiffsplit', 'Git diff')

call g:quickmenu#append('# Code', '')
call g:quickmenu#append('ALE Fix', 'ALEFix', 'Fix with ALE')
call g:quickmenu#append('Format', 'Autoformat', 'Autoformat')
call g:quickmenu#append('Check Syntax', 'SyntasticCheck', 'Check syntax')

call g:quickmenu#append('# Session', '')
call g:quickmenu#append('Save Session', 'Obsession', 'Start/stop session recording')
call g:quickmenu#append('Reload Vimrc', 'VimReload', 'Reload configuration')

" === Меню 1 (дополнительное) ===
call g:quickmenu#current(1)
call g:quickmenu#reset()

call g:quickmenu#append('# Debug', '')
call g:quickmenu#append('Vimspector Launch', 'call vimspector#Launch()', 'Start debugger')
call g:quickmenu#append('Vimspector Reset', 'call vimspector#Reset()', 'Stop debugger')
call g:quickmenu#append('Toggle Breakpoint', 'call vimspector#ToggleBreakpoint()', 'Toggle breakpoint')
call g:quickmenu#append('Clear Breakpoints', 'call vimspector#ClearBreakpoints()', 'Clear all breakpoints')

call g:quickmenu#append('# Notes', '')
call g:quickmenu#append('Common Notes', 'call CommonNotesWindowToggle()', 'Toggle common notes')
call g:quickmenu#append('Python Notes', 'call PythonBriefNotesToggle()', 'Toggle Python notes')
call g:quickmenu#append('Vim Cheat', 'call VimCheatToggle()', 'Open vim cheatsheet')

call g:quickmenu#append('# Utils', '')
call g:quickmenu#append('Calendar', 'Calendar', 'Open calendar')
call g:quickmenu#append('Clear Registers', 'RegClear', 'Clear all registers')
call g:quickmenu#append('DiffOrig', 'DiffOrig', 'Diff with saved version')
