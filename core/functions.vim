" core/functions.vim — Общие функции
" ══════════════════════════════════════════════════════════════════════════════

" === Создание директории если не существует ===
function! MakeDirIfNoExists(path) abort
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), "p")
        echom "Created directory: " . expand(a:path)
    endif
endfunction

" === Python команда (кроссплатформенная) ===
function! GetPythonCmd() abort
    return g:python_cmd
endfunction

" === Запуск Python кода (range) ===
function! PyRun() range abort
    let l:code = join(getline(a:firstline, a:lastline), "\n")
    echo system(GetPythonCmd() . ' -c ' . shellescape(l:code))
endfunction
command! -range=% -nargs=0 Pun :<line1>,<line2>call PyRun()

" === Pytest ===
function! Pytest() abort
    if g:is_nvim
        execute 'terminal ' . GetPythonCmd() . ' -m pytest -vs'
    else
        execute '!' . GetPythonCmd() . ' -m pytest -vs'
    endif
endfunction
command! Pytest call Pytest()

" === DiffOrig — сравнение с сохранённой версией ===
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

" === Открыть tmp.py (умно) ===
function! SmartOpenTmpPy() abort
    let l:bufnum = bufnr('tmp.py')
    if l:bufnum != -1
        execute 'sbuffer ' . l:bufnum
    else
        execute 'vs tmp.py'
    endif
endfunction

" === Поиск слова с ripgrep ===
function! SearchWordWithRg() abort
    let l:word = expand('<cword>')
    let l:cmd = 'rg --vimgrep --smart-case --hidden -g "!venv" -g "!tags" ' . shellescape(l:word)
    let l:results = system(l:cmd)
    if !empty(l:results)
        call setqflist([], ' ', {'lines': split(l:results, "\n"), 'efm': '%f:%l:%c:%m'})
        copen
    else
        echo "No results found for: " . l:word
    endif
endfunction

" === Ranger file chooser (Linux only) ===
function! RangerChooser() abort
    if g:is_win
        echo "Ranger не поддерживается на Windows"
        return
    endif
    exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
    if filereadable('/tmp/chosenfile')
        exec 'edit ' . system('cat /tmp/chosenfile')
        call system('rm /tmp/chosenfile')
    endif
    redraw!
endfunction

" === LF file chooser ===
function! LFChooser() abort
    let l:tmpfile = g:is_win ? expand('$TEMP/chosenfile') : '/tmp/chosenfile'
    exec "silent !lf -selection-path=" . l:tmpfile . " " . expand("%:p:h")
    if filereadable(l:tmpfile)
        exec 'edit ' . readfile(l:tmpfile)[0]
        call delete(l:tmpfile)
    endif
    redraw!
endfunction

" === Auto close bracket ===
function! s:CloseBracket() abort
    let l:line = getline('.')
    if l:line =~# '^\s*\(struct\|class\|enum\) '
        return "{\<Enter>};\<Esc>O"
    elseif searchpair('(', '', ')', 'bmn', '', line('.'))
        return "{\<Enter>});\<Esc>O"
    else
        return "{\<Enter>}\<Esc>O"
    endif
endfunction
inoremap <expr> {; <SID>CloseBracket()

" === Очистка регистров ===
command! RegClear for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" === Reload vimrc ===
if !exists('*ReloadVim')
    function! ReloadVim() abort
        let l:view_dir = g:is_win ? expand('~/_vim/view') : expand('~/.vim/view')
        if isdirectory(l:view_dir)
            exec "!rm -rf " . l:view_dir . "/*"
        endif
        if exists('#AutoGroup')
            autocmd! AutoGroup
        endif
        exec "so $MYVIMRC"
        echo "Vimrc reloaded!"
    endfunction
endif
command! VimReload call ReloadVim()

" === Toggle notes windows ===
let g:PythonBriefNotesOpened=0
let g:CheetOpened=0
let g:CommonOpened=0

function! PythonBriefNotesToggle() abort
    let l:notes_path = g:is_win 
        \ ? expand('~/Documents/vimwiki/tech.wiki/Python_brief_notes.wiki')
        \ : expand('/home/st/MegaLinux/tech.wiki/Python_brief_notes.wiki')
    
    if g:PythonBriefNotesOpened > 0
        if bufname('%') == 'Python_brief_notes.wiki'
            exec "wq"
            let g:PythonBriefNotesOpened=0
        else
            let l:curbuf=bufnr('%')
            try
                exe g:PythonNotesWindow.','.g:PythonNotesWindow.'bufdo :wq'
            catch
            finally
                exe l:curbuf.'b'
            endtry
            let g:PythonBriefNotesOpened=0
        endif
    else
        execute ':vsplit ' . l:notes_path
        let g:PythonNotesWindow=bufnr()
        let g:PythonBriefNotesOpened=1
    endif
endfunction

function! VimCheatToggle() abort
    let l:cheat_path = g:is_win 
        \ ? expand('~/Documents/vimwiki/tech.wiki/MyVimCheatSheet.wiki')
        \ : expand('/home/st/MegaLinux/tech.wiki/MyVimCheatSheet.wiki')
    execute ':vsplit ' . l:cheat_path
endfunction

function! CommonNotesWindowToggle() abort
    let l:notes_path = g:is_win 
        \ ? expand('~/Documents/vimwiki/tech.wiki/CommonNotes.txt')
        \ : expand('/home/st/MegaLinux/tech.wiki/CommonNotes.txt')
    
    if g:CommonOpened > 0
        if bufname('%') == 'CommonNotes.txt'
            exec "wq"
            let g:CommonOpened=0
        else
           let l:curbuf=bufnr('%')
           try
               exe g:CommonWindow.','.g:CommonWindow.'bufdo :wq'
           catch
           finally
               exe l:curbuf.'b'
           endtry
           let g:CommonOpened=1
        endif
    else
        execute ':vsplit ' . l:notes_path
        let g:CommonWindow=winnr()
        let g:CommonOpened=1
    endif
endfunction

" === Cursor highlight toggle ===
command! Cursor set cursorline | set cursorcolumn

" === Debug commands ===
command! Debug !node inspect ./%
command! Mk !node ./%

" === Очистка неактивных буферов ===
function! DeleteInactiveBufs()
    " Собираем список буферов во всех табах
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor

    let nWipeouts = 0
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
            silent exec 'bwipeout' i
            let nWipeouts = nWipeouts + 1
        endif
    endfor
    echomsg nWipeouts . ' buffer(s) wiped out'
endfunction

command! Ball :call DeleteInactiveBufs()
command! BAll :call DeleteInactiveBufs()
