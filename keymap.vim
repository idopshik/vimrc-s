" "vim: fdm=expr
command! Debug !node inspect ./%
command! Mk !node ./%
command! T :tabnew ~/Dropbox/.vim_cloud/vimwiki/tech.wiki/tasks.wiki
command! Cursor set cursorline | set cursorcolumn

" crear register command
command! RegClear for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

fu PyRun() range
echo system('python3 -c ' . shellescape(join(getline(a:firstline, a:lastline), "\n")))

endf


python3 << EOL
import vim
def ExecuteSelectedLine(l1, l2):
    for i in range(l1-1,l2):
        print(">>" + vim.current.buffer[i])
        exec(vim.current.buffer[i],globals())
EOL
command! -range Eval <line1>,<line2> python3 ExecuteSelectedLine(<line1>, <line2>)

"python run - pun
command -range=% -nargs=0 Pun :<line1>,<line2>call PyRun()

"в VisualMode можно выполнить код
vmap <F9> :call PyRun()<CR>   
"=====================================================
"#        AutomaticallommentToggle "doesn't work in linux
"=====================================================
"auto close {
function! s:CloseBracket()
let line = getline('.')
if line =~# '^\s*\(struct\|class\|enum\) '
    return "{\<Enter>};\<Esc>O"
elseif searchpair('(', '', ')', 'bmn', '', line('.'))
    " Probably inside a function call. Close it off.
    return "{\<Enter>});\<Esc>O"
else
    return "{\<Enter>}\<Esc>O"
endif
endfunction

inoremap <expr> {; <SID>CloseBracket()

inoremap (<Space> ()<Esc>i
inoremap [<Space> []<Esc>i
inoremap {<Space> {}<Esc>i
inoremap (; (<CR>)<C-c>O
inoremap (, (<CR>)<C-c>O
" inoremap {; {<CR>}<C-c>O

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
nnoremap <leader><leader>v :vsplit ~/Dropbox/.vim_cloud/vimwiki/tech.wiki/Python_brief_notes.wiki <cr>


"=====================================================
"#        KEY mapping
"=====================================================

"The timeout settings are used to work around the ambiguity with escape sequences. Esc
"and j sent within 50ms will be mapped to <A-j>, greater than 50ms will count as separate "keys.
"all this replaced  Plug 'matze/vim-move'

if exists('$TMUX')
else
endif

let c='a'
while c <= 'z'
exec "set <A-".c.">=\e".c
exec "imap \e".c." <A-".c.">"
let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=10   " can ponentially cause problems.
nnoremap <silent><A-j> :m .+1<CR>==
nnoremap <silent><A-k> :m .-2<CR>==
inoremap <silent><A-j> <Esc>:m .+1<CR>==gi
inoremap <silent><A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent><A-j> :m '>+1<CR>gv=gv
vnoremap <silent><A-k> :m '<-2<CR>gv=gv

"<Plug> - через это не все команды работают.

"//Просто всегда при выходе из insert - en! genuine and simple. Надо (редко) - входишь в ru
"//terminal only. doesn't work in Gvim.
"xkb-switch required
let g:XkbSwitchLib = "/usr/lib/libxkbswitch.so.1.8.5"
function! InsertLeaveFun()
call libcall(g:XkbSwitchLib, 'Xkb_Switch_setXkbLayout', 'us')
" silent !setxkbmap us "Ломает системную переключалку
" echo libcall(g:XkbSwitchLib, 'Xkb_Switch_getXkbLayout', '')
endfunction

autocmd InsertLeave * call InsertLeaveFun()
" Никак не могу приспособиться к этому.I literally hate it!
" autocmd VimEnter * map! <C-k> <C-^>

" vimwiki
map <leader>wp <Plug>VimwikiDiaryPrevDay
map <leader>wn <Plug>VimwikiDiaryNextDay

"fzf

nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
map <C-p> :Files<CR>
map <Leader>r :Files ~/.vim_runtime/<CR>
nnoremap <silent> <leader><Space> :FZFMru<CR>
nnoremap <silent> <leader>. :Files <C-r>=expand("%:h")<CR>
nnoremap <silent> <leader>b :Buffers <CR>
nnoremap <silent> <leader>h :Helptags<CR>

map <Space> :noh<cr>
map <C-tab> :bn<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

if has('gui_running')
" TERMINAL only! Ranger won't work in Gui
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

"%% ic Command-line mode to refer to the directory of the current file, regardledd of pwd.
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" map <Leader>cd :lcd%:p:h<cr> | redraw!
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>

"Reload vimrc w/o restarting VIM (with view's deleting!)
if !exists('*ReloadVim')
    fun ReloadVim()
        exec "!rm -f -r ~/.vim/view/*"
        autocmd! AutoGroup
        exec "so $MYVIMRC"
    endfun
endif

command! VimReload :call ReloadVim()<cr>

"=====================================================
"#        RUN (F5, F6)
"=====================================================

autocmd FileType html nnoremap <F5> :exe ':silent !firefox %'<CR>
autocmd FileType html nnoremap <buffer> <F6> :silent update<Bar>silent !firefox %:p &<CR>

autocmd FileType python map <F6> <Esc>:w<CR>:!clear;python3 %<CR>
" autocmd FileType python map <F6> <Esc>:w<CR>:!clear;/bin/python3 %<CR>
autocmd FileType python map <F5> <Esc>:This keemap is free to bind for smth. Press ESC

autocmd FileType javascript nnoremap <buffer> <F5> <Esc> :w<CR> <Esc> k <Esc> :! clear; node %<CR>
autocmd FileType javascript nnoremap <buffer> <F6> <Esc> :w<CR> <Esc> k <Esc> :! clear; node %<CR>
autocmd FileType javascript set makeprg=node\ %

autocmd FileType typescript nnoremap <buffer> <F5> <Esc> :w<CR> <Esc> k <Esc> :! tsc %<CR>

autocmd FileType sh nnoremap <buffer> <F6><Esc>:w<CR>:! clear; ./%<CR>
autocmd FileType sh nnoremap <buffer> <F5> <Esc>:w<CR> :! ./%<CR>

"=====================================================
"#        KEY mappings again
"=====================================================
"мешает переключению буферов. надо перемапить.
" nnoremap <silent> <leader>bb :silent update<Bar>silent !google-chrome %:p &<CR>

nnoremap <Leader>a :Ack<CR> " поиск слова под курсором. Мощнейший ack.

map <C-n> :NERDTreeToggle<CR>

nnoremap <leader>nn :NERDTreeFind<CR>

nmap <F3> :ALEFix <CR>
nmap <F2> :ALEPopulateQuickfix <CR>

" nmap <F4> :Prettier <CR>
nmap <F4> :Autoformat <CR>
" nmap <Leader>yp <Plug>(Prettier)
" TODO Это не факт что будет удобно. И вообще работать.
" это переопределяет prettier-keymap(плагином ставится) и работает.
" но как оно будет работать на одном и том же процессе при разных беферах
" друг рядом с другом и py и js?
"autocmd FileType python nnoremap <leader>p :Autoformat<CR> Эта комбинация ещё
"приготится.


nnoremap <F7> ::UndotreeToggle<CR>

map <F8> :TagbarToggle<CR>

"doesn't work in linux
map <C-_> <plug>NERDCommenterToggle
" map <C-c> <plug>NERDCommenterToggle

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

" map <alt+n> to navigate through tabs (redundant for me)
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



"  `\|||/´         MMM           \|/            www            __^__          ~
"   (o o)         (o o)          @ @           (O-O)          /(o o)\\        ~
"ooO_(_)_Ooo__ ooO_(_)_Ooo___oOO_(_)_OOo___oOO__(_)__OOo___oOO__(_)__OOo_____ ~
"_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|____ ~
"__|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_ ~
"_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|____ ~
