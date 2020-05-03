" vim: fdm=expr
command! Debug !node inspect ./%
command! Mk !node ./%
command! T :tabnew ~/Dropbox/.vim_cloud/vimwiki/tech.wiki/tasks.wiki
command! Cursor set cursorline | set cursorcolumn

"" crear register command  
command! ClearReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

fu PyRun() range
  echo system('python3 -c ' . shellescape(join(getline(a:firstline, a:lastline), "\n")))
endf

vmap <F9> :call PyRun()<CR>
"=====================================================
"#        AutomaticallommentToggle "doesn't work in linux
"=====================================================

inoremap (<Space> ()<Esc>i
inoremap [<Space> []<Esc>i
inoremap {<Space> {}<Esc>i
inoremap (; (<CR>)<C-c>O
inoremap (, (<CR>)<C-c>O
inoremap {; {<CR>}<C-c>O
inoremap {, {<CR>}<C-c>O
inoremap [; [<CR>]<C-c>O
inoremap [, [<CR>]<C-c>O

"=====================================================
"#        Terminal
"=====================================================
"vert[ical] term[imal]. Close it by <esc><esc>:q<CR>
cmap vt vertical terminal
tmap <S-Insert> <C-W>"+
tnoremap <ESC><ESC> <C-\><C-N> " хотя лучше бы запомнить <C-W>N и всё. Это команда перехода в нормальный режим. выход из него по вводу i/a
" Sample open-file mapping
nnoremap <leader><leader>v :vsplit ~/Documents/vimtest/test1.vim <cr>

"=====================================================
"#        KEY mapping
"=====================================================

"Это открывает fullscreen. Переношу в автокоманды.
" noremap <C-CR> :!wmctrl -r ':ACTIVE:' -b toggle,fullscreen <CR>

"TODO в TMUX каким-то побразом ctrl [  вызывает alt и я двигаю строки.
"line move related mappings
"The timeout settings are used to work around the ambiguity with escape sequences. Esc
"and j sent within 50ms will be mapped to <A-j>, greater than 50ms will count as separate "keys.
"all this replaced  Plug 'matze/vim-move'

if exists('$TMUX')
    "возможно, может мне пригодиться это, и очень скоро.
else
endif

    let c='a'
    while c <= 'z'
        exec "set <A-".c.">=\e".c
        exec "imap \e".c." <A-".c.">"
        let c = nr2char(1+char2nr(c))
    endw
    set timeout ttimeoutlen=10   " can ponentially cause problems. Blame this first!
    nnoremap <silent><A-j> :m .+1<CR>==
    nnoremap <silent><A-k> :m .-2<CR>==
    inoremap <silent><A-j> <Esc>:m .+1<CR>==gi
    inoremap <silent><A-k> <Esc>:m .-2<CR>==gi
    vnoremap <silent><A-j> :m '>+1<CR>gv=gv
    vnoremap <silent><A-k> :m '<-2<CR>gv=gv

"<Plug> - Вот через это фуфло GitGutter так и не работли команды.

"change keymap file (winh a trick to override plugin's mapping)

"//ПРОСТО ВЕЛИКОЛЕПИЕ. Столько лет боли с раскладками.
"//Просто всегда при выходе из insert - en! Гениально. Надо (редко) - входишь в ru! 
"//Но только в терминале. В Gvim - сосамба.
"требует установить xkb-switch
let g:XkbSwitchLib = "/lib/libxkbswitch.so"
function! InsertLeaveFun()
    "решает проблему с языком системы при выходе из insert
    call libcall(g:XkbSwitchLib, 'Xkb_Switch_setXkbLayout', 'us')
    " silent !setxkbmap us "Ломает" системную переключалку
    " echo libcall(g:XkbSwitchLib, 'Xkb_Switch_getXkbLayout', '')
endfunction

"TODO почему это не работает?
" nnoremap о  call libcall(g:XkbSwitchLib, 'Xkb_Switch_setXkbLayout', 'us')
" inoremap <C-х>  <ESC>

autocmd InsertLeave * call InsertLeaveFun()
" Никак не могу приспособиться к этому.I literally hate it!
" autocmd VimEnter * map! <C-k> <C-^>

" vimwiki
map <leader>wp <Plug>VimwikiDiaryPrevDay
map <leader>wn <Plug>VimwikiDiaryNextDay

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

"fzf - search in folder
" map <C-p> :Files ~/.config/<CR>
map <C-p> :Files<CR>
"TODO fix linux/windows прикол с этим underslacKEY mappings again
map <Leader>r :Files ~/.vim_runtime/<CR>
nnoremap <silent> <leader><Space> :FZFMru<CR>
nnoremap <silent> <leader>. :Files <C-r>=expand("%:h")<CR>
nnoremap <silent> <leader>b :Buffers <CR>
nnoremap <silent> <leader>h :Helptags<CR>

map <Space> :noh<cr>
map <C-tab> :bn<CR>

"" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Use Ranger as a file explorer {{{

" TERMINAL only! Ranger won't work in Gui

if has('gui_running')
    "Это такой костыль. Не знаю как не назначть в gvim.
else
    map <Leader>x :call RangerChooser()<CR>
endif

fun! RangerChooser()
    exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
    if filereadable('/tmp/chosenfile')
        exec 'edit ' . system('cat /tmp/chosenfile')
        call system('rm /tmp/chosenfile')
    endif
    redraw!
endfun
"
"was written what whitespace at the end was mandatory. But w/o it - all works well.
map <Leader>l :Leaderf self<CR>

"TODO из-за этого на русском тормози буква б. Не сталь ничего на imap
" let g:UltiSnipsExpandTrigger = '<Leader>s' "Select snippet in drop out menu Youcompletemy

"%% ic Command-line mode to refer to the directory of the current file, regardledd of pwd.
cnoremap %% <C-R>=expand('%:h').'/'<CR>

"Reload vimrc w/o restarting VIM (with view's deleting!)
if !exists('*ReloadVim')
    fun ReloadVim()
        exec "!rm -f -r ~/.vim/view/*"
        autocmd! AutoGroup
        exec "so $MYVIMRC"
    endfun
endif
nnoremap <leader>ee :call ReloadVim()<cr>

"=====================================================
"#        RUN (F5, F6)                  
"=====================================================
"
autocmd FileType html nnoremap <F5> :exe ':silent !firefox %'<CR>
autocmd FileType html nnoremap <buffer> <F6> :silent update<Bar>silent !firefox %:p &<CR>

autocmd FileType python map <F6> <Esc>:w<CR>:!clear;/bin/python3 %<CR>
autocmd FileType python map <F5> <Esc>:w<CR>:!clear;/bin/python2.7 %<CR>

autocmd FileType javascript nnoremap <buffer> <F5> <Esc> :w<CR> <Esc> k <Esc> :! clear; node %<CR>
autocmd FileType javascript nnoremap <buffer> <F6> <Esc> :w<CR> <Esc> k <Esc> :! clear; node %<CR>
autocmd FileType javascript set makeprg=node\ %


autocmd FileType sh nnoremap <buffer> <F6><Esc>:w<CR>:! ./%<CR>
autocmd FileType sh nnoremap <buffer> <F5> <Esc>:w<CR> :! ./%<cr>

"=====================================================
"#        KEY mappings again
"=====================================================
"мешает переключению буферов. надо перемапить.
" nnoremap <silent> <leader>bb :silent update<Bar>silent !google-chrome %:p &<CR>

cnoremap %% <C-R>=expand('%:h').'/'<CR>

map <C-n> :NERDTreeToggle<CR>

nnoremap <leader>nn :NERDTreeFind<CR>


nmap <F3> :ALEFix <CR>
" map <F3> <Esc>:w<CR>:!C:\Progs\anaconda\Scripts\pylint.exe %<CR>

nmap <F4> :Prettier <CR>

nnoremap <F7> ::UndotreeToggle<CR>

map <F8> :TagbarToggle<CR>

map <C-_> NerdCommentToggle "doesn't work in linux
map <C-c> <plug>NERDCommenterToggle

map <C-n> :NERDTreeToggle<CR>

let g:CheetOpened=0
function! VimNotesWindowToggle()
    if g:CheetOpened > 0
        if bufname('%') == 'MyVimCheatSheet.wiki'
            silent close!
            let g:CheetOpened=0
        else
            exe g:CheetWindow . "wincmd w" | wincmd c 
            let g:CheetOpened=0
            echo "Closed anyway regarles of location and newly stuff in \"cheet\" window"
        endif
    else
        :vsplit ~/Dropbox/.vim_cloud/vimwiki/tech.wiki/MyVimCheatSheet.wiki
        let g:CheetWindow=winnr()
        let g:CheetOpened=1
    endif
endfunc

let g:CommonOpened=0
function! CommonNotesWindowToggle()
    if g:CommonOpened > 0
        if bufname('%') == 'CommonNotes.txt'
            w
            bd
            " silent close!
            let g:CommonOpened=0
        else
            exe g:CheetWindow . "wincmd w" | wincmd c 
            let g:CommonOpened=0
            echo "Closing note's buf forcelly"
        endif
    else
        :vsplit ~/Dropbox/.vim_cloud/vimwiki/CommonNotes.md
        let g:CheetWindow=winnr()
        let g:CommonOpened=1
    endif
endfunc


noremap <silent><Leader>n :call CommonNotesWindowToggle()<cr>
noremap <silent><Leader>k :call VimNotesWindowToggle()<cr>
noremap <silent><Leader>m :call quickmenu#toggle(0)<cr><cr>
noremap <silent><Leader>2 :call quickmenu#toggle(1)<cr><cr> 

" map <alt+n> to navigate through tabs
for c in range(1, 9)
    exec "set <A-".c.">=\e".c
    exec "map \e".c." <A-".c.">"

    let n = c - '0'
    exec "map <M-". n ."> ". n ."gt"
endfor

"#        Window's           
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"=====================================================
"#        Toggle bar's and fullscreen Windows only
"=====================================================
"Toggle munu-bar, status-bar,right scroll line
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

"=====================================================
"#        VimWiki-calendar
"=====================================================
au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki map <Leader>d :VimwikiMakeDiaryNote<CR>
function! ToggleCalendar()
    execute ":Calendar"
    if exists("g:calendar_open")
        if g:calendar_open == 1
            execute "q"
            unlet g:calendar_open
        else
            g:calendar_open = 1
        end
    else
        let g:calendar_open = 1
    end
endfunction

"Решение проблемы - когда буфер вики в фоне - нельзя даже c (change) сделать!"
:autocmd FileType vimwiki map <leader>c :call ToggleCalendar()<CR>


"  `\|||/´         MMM           \|/            www            __^__          ~
"   (o o)         (o o)          @ @           (O-O)          /(o o)\\        ~
"ooO_(_)_Ooo__ ooO_(_)_Ooo___oOO_(_)_OOo___oOO__(_)__OOo___oOO__(_)__OOo_____ ~
"_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|____ ~
"__|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_ ~
"_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|____ ~
