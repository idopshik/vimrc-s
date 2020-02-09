" Sample open-file mapping
nnoremap <leader><leader>v :vsplit ~/Documents/vimtest/test1.vim <cr>

"=====================================================
"" KEY mapping
"=====================================================
"line move related mappings
"The timeout settings are used to work around the ambiguity with escape sequences. Esc
"and j sent within 50ms will be mapped to <A-j>, greater than 50ms will count as separate "keys.
"all this replaced  Plug 'matze/vim-move'
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50   " can ponentially cause problems. Blame this first!
nnoremap <silent><A-j> :m .+1<CR>==
nnoremap <silent><A-k> :m .-2<CR>==
inoremap <silent><A-j> <Esc>:m .+1<CR>==gi
inoremap <silent><A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent><A-j> :m '>+1<CR>gv=gv
vnoremap <silent><A-k> :m '<-2<CR>gv=gv


"<Plug> - Вот через это фуфло GitGutter так и не работли команды.

"change keymap file (winh a trick to override plugin's mapping)
autocmd VimEnter * map! <C-k> <C-^>

" vimwiki
map <leader>wp <Plug>VimwikiDiaryPrevDay
map <leader>wn <Plug>VimwikiDiaryNextDay

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

"fzf - search in folder
" map <C-p> :Files ~/.config/<CR>
map <C-p> :Files<CR>
"TODO fix linux/windows прикол с этим underslacs-точка.
map <Leader>r :Files ~/.vim_runtime/<CR>
nnoremap <silent> <leader><Space> :FZFMru<CR>
nnoremap <silent> <leader>. :Files <C-r>=expand("%:h")<CR>
nnoremap <silent> <leader>b :Buffers <CR>
nnoremap <silent> <leader>h :Helptags<CR>


map <Space> :noh<cr>
map c-<tab> :bn<CR>
"" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Use Ranger as a file explorer {{{

" TERMINAL only! Ranger won't work in Gui
"
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
"Пробельный символ вконце здесь нужен. Без всяких alefix здесь!
map <Leader>l :Leaderf self<CR>


let g:UltiSnipsExpandTrigger = '<Leader>s' "Select snippet in drop out menu Youcompletemy

"%% ic Command-line mode to refer to the directory of the current file, regardledd of pwd.
"Windows-прикол какой-то? На Linux ./ и куча пробелов
cnoremap %% <C-R>=expand('%:h').'/'<CR>

"Reload vimrc w/o restarting VIM
nnoremap <leader>ee :so $MYVIMRC<CR>

" map <F3> <Esc>:w<CR>:!C:\Progs\anaconda\Scripts\pylint.exe %<CR>

"----------- RUN  ----------------"
autocmd FileType html nnoremap <buffer> <F6> :silent update<Bar>silent !firefox %:p &<CR>
" autocmd FileType python map <F6> <Esc>:w<CR>:!clear;python %<CR>
" autocmd FileType html nnoremap <F6> :exe ':silent !firefox %'<CR>

autocmd FileType python nnoremap <buffer> <F6> :exec '!python' shellescape(@%, 1)<cr>

autocmd FileType javascript nnoremap <buffer> <F5> <Esc> :!clear; node %<CR>
autocmd FileType javascript nnoremap <buffer> <F6> <Esc> :w<CR>:! clear; node %<CR>
nnoremap <silent> <leader>bb :silent update<Bar>silent !firefox %:p &<CR>

autocmd FileType sh nnoremap <buffer> <F5> <Esc>:w<CR> :! ./%<cr>


" When pressing <leader>cd switch to the directory of the open buffer Не надо, это
" автоматом где-то настроено.
map <Leader>cd :lcd %:p:h<CR>:pwd<CR>

"%% ic Command-line mode to refer to the directory of the current file, regardledd of pwd.
"
cnoremap %% <C-R>=expand('%:h').'/'<CR>

nnoremap <leader>nn :NERDTreeFind<CR>

nmap <F3> <Plug>(ale_fix)

map <F4> <Esc>:w<CR>:! ./%<CR>

nnoremap <F7> :GundoToggle<CR>

map <F8> :TagbarToggle<CR>

map <C-_> NerdCommentToggle "doesn't work in linux
map <C-c> <plug>NERDCommenterToggle

map <C-n> :NERDTreeToggle<CR>

function! WhichTab(filename)
    " Try to determine whether file is open in any tab.
    " Return number of tab it's open in
    let buffername = bufname(a:filename)
    if buffername == ""
        return 0
    endif
    let buffernumber = bufnr(buffername)

    " tabdo will loop through pages and leave you on the last one;
    " this is to make sure we don't leave the current page
    let currenttab = tabpagenr()
    let tab_arr = []
    tabdo let tab_arr += tabpagebuflist()

    " return to current page
    exec "tabnext ".currenttab

    " Start checking tab numbers for matches
    let i = 0
    for tnum in tab_arr
        let i += 1
        echo "tnum: ".tnum." buff: ".buffernumber." i: ".i
        if tnum == buffernumber
            return i
        endif
    endfor

endfunction

function! WhichWindow(filename)
    " Try to determine whether the file is open in any GVIM *window*
    let serverlist = split(serverlist(),"\n")

    "let currentserver = ????
    for server in serverlist
        let remotetabnum = remote_expr(server,
            \"WhichTab('".a:filename."')")
        if remotetabnum != 0
            return server
        endif
    endfor

endfunction


" exec "tabnext ".WhichTab('my_filename')

" echo remote_foreground( WhichWindow('my_filename') )

function! Window_close()
    if bufwinnr('MyVimCheatSheet.wiki') > 0
        if bufname('%') == 'MyVimCheatSheet.wiki'
            silent close!
        else
            echo "Already open"
        endif
    else
        :vsplit ~/Dropbox/.vim_cloud/vimwiki/personal.wiki/MyVimCheatSheet.wiki
    endif
endfunc

"Откроем мой файл с тем, что надо поучить!"
noremap <silent><Leader>k :call Window_close()<cr>
noremap <silent><Leader>m :call quickmenu#toggle(0)<cr><cr>


" map <alt+n> to navigate through tabs
for c in range(1, 9)
    exec "set <A-".c.">=\e".c
    exec "map \e".c." <A-".c.">"

    let n = c - '0'
    exec "map <M-". n ."> ". n ."gt"
endfor

" Alternatively use
"nnoremap th :tabnext<CR>
"nnoremap tl :tabprev<CR>
"nnoremap tn :tabnew<CR>

"---------Window's-----------
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"
"
"=====================================================
"      Toggle bar's and fullscreen Windows only
"=====================================================
"Toggle munu-bar, status-bar,right scroll line
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

"=====================================================
"       VimWiki
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
