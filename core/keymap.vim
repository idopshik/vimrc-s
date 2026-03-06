" core/keymap.vim — СВЯЩЕННЫЕ KEYMAPS (НЕ ТРОГАТЬ!)
" ══════════════════════════════════════════════════════════════════════════════
" ⚠️  ВНИМАНИЕ: Этот файл содержит годами наработанные keymaps
" ⚠️  Изменения только с явного согласия владельца!
" ══════════════════════════════════════════════════════════════════════════════
"
" === Подсветить слово БЕЗ перемещения курсора ===
nnoremap <leader>* *N

" === tmp.py quick open ===
nnoremap <leader>] :call SmartOpenTmpPy()<CR>

" === Ripgrep search ===
nnoremap <Leader>f :call SearchWordWithRg()<CR>

" === Python debug ===
imap <C-b> __import__('pdb').set_trace()
nnoremap <leader>B o__import__('pdb').set_trace()<ESC>

" === Visual mode Python run ===
vmap <F9> :call PyRun()<CR>

" === Auto-pairs (brackets) ===
inoremap (<Space> ()<Esc>i
inoremap [<Space> []<Esc>i
inoremap {<Space> {}<Esc>i
inoremap (; (<CR>)<C-c>O
inoremap (, (<CR>)<C-c>O
inoremap {, {<CR>}<C-c>O
inoremap [; [<CR>]<C-c>O
inoremap [, [<CR>]<C-c>O

" === Vifm ===
nnoremap <leader>v :Vifm<CR>

" === Terminal ===
cmap vt vertical terminal
tmap <S-Insert> <C-W>"+
tnoremap <ESC><ESC> <C-\><C-N>

" === Line movement (Alt+j/k) ===
" Timeout settings for escape sequences
set timeout ttimeoutlen=10

nnoremap <silent><A-j> :m .+1<CR>==
nnoremap <silent><A-k> :m .-2<CR>==
inoremap <silent><A-j> <Esc>:m .+1<CR>==gi
inoremap <silent><A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent><A-j> :m '>+1<CR>gv=gv
vnoremap <silent><A-k> :m '<-2<CR>gv=gv

" Alt key setup for terminal
let c='a'
while c <= 'z'
    let c = nr2char(1+char2nr(c))
endwhile

" === Keyboard layout switch (Linux only, xkb-switch) ===
if g:is_linux && !g:is_nvim
    let g:XkbSwitchLib = "/usr/local/lib/libxkbswitch.so"
    
    function! InsertLeaveFun() abort
        if filereadable(g:XkbSwitchLib)
            call libcall(g:XkbSwitchLib, 'Xkb_Switch_setXkbLayout', 'us')
        endif
    endfunction
    
    autocmd InsertLeave * call InsertLeaveFun()
endif

" === Vimwiki ===
map <leader>wp <Plug>VimwikiDiaryPrevDay
map <leader>wn <Plug>VimwikiDiaryNextDay

" === FZF (только Vim) или Telescope (только Neovim) ===
if g:is_nvim
    " Telescope keymaps будут загружены из nvim_telescope.vim
else
    " === FZF keymaps (Vim only) ===
    nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
    map <Leader>r :Files ~/.vim_runtime/<CR>
    nnoremap <silent> <leader><Space> :FZFMru<CR>
    nnoremap <silent> <leader>. :Files <C-r>=expand("%:h")<CR>
    nnoremap <silent> <leader>b :Buffers<CR>
    nnoremap <silent> <leader>h :Helptags<CR>
endif

" === Clear search highlight ===
map <Space> :noh<cr>

" === Buffer navigation ===
map <C-tab> :bn<CR>

" === Sudo write ===
if !g:is_win
    cmap w!! w !sudo tee > /dev/null %
endif

" === File manager (Ranger/LF) ===
nnoremap <leader>x :call RangerChooser()<CR>

" === Current directory in command line ===
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" === Exit to shell with context ===
command! -nargs=0 Sh call s:ExitToShell()
cabbrev sh Sh  " alias :sh -> :Sh
function! s:ExitToShell() abort
    let l:file = expand('%:p')
    let l:dir = expand('%:p:h')
    echo '╔════════════════════════════════════════╗'
    echo '║  Выход в shell                         ║'
    echo '╠════════════════════════════════════════╣'
    echo '║  Файл: ' . l:file
    echo '║  Директория: ' . l:dir
    echo '╚════════════════════════════════════════╝'
    echo ''
    echo 'Введи exit или Ctrl+D для возврата в Vim'
    if g:is_nvim
        execute 'terminal'
    else
        execute 'shell'
    endif
endfunction

" === Change to file's directory ===
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>

" === RUN (F5, F6) — Filetype specific ===
autocmd FileType html nnoremap <buffer> <F5> :exe ':silent !firefox %'<CR>
autocmd FileType html nnoremap <buffer> <F6> :silent update<Bar>silent !firefox %:p &<CR>

autocmd FileType python map <buffer> <F6> <Esc>:w<CR>:execute '!' . g:python_cmd . ' %'<CR>
autocmd FileType python map <buffer> <F5> <Esc>:w<CR>:execute 'terminal ' . g:python_cmd . ' %'<CR>

autocmd FileType lua map <buffer> <F5> <Esc>:w<CR>:terminal lua %<CR>
autocmd FileType lua map <buffer> <F6> <Esc>:w<CR>:terminal lua %<CR>

autocmd FileType javascript nnoremap <buffer> <F5> <Esc>:w<CR>:!clear; node %<CR>
autocmd FileType javascript nnoremap <buffer> <F6> <Esc>:w<CR>:!clear; node %<CR>
autocmd FileType javascript set makeprg=node\ %

autocmd FileType typescript nnoremap <buffer> <F5> <Esc>:w<CR>:!tsc %<CR>

autocmd FileType sh nnoremap <buffer> <F5> <Esc>:w<CR>:!./%<CR>
autocmd FileType sh nnoremap <buffer> <F6> <Esc>:w<CR>:!clear; ./%<CR>

" === ACK/AG search ===
nnoremap <Leader>a :Ack<CR>
let g:ackprg = 'ag --vimgrep --smart-case --hidden'

" === NERDTree (КРИТИЧНО!) ===
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>nn :NERDTreeFind<CR>

" === ALE ===
nmap <F3> :ALEFix<CR>
nmap <F2> :ALEPopulateQuickfix<CR>

" === Autoformat ===
nmap <F4> :Autoformat<CR>

" === Undotree ===
nnoremap <F7> :UndotreeToggle<CR>

" === Tagbar (КРИТИЧНО!) ===
nnoremap <F9> :TagbarToggle<CR>

" === NERDCommenter ===
map <C-_> <plug>NERDCommenterToggle

" === Notes toggles ===
noremap <silent><Leader>n :call CommonNotesWindowToggle()<cr>
noremap <silent><Leader>k :call VimCheatToggle()<cr>
noremap <silent><Leader>m :call quickmenu#toggle(0)<cr><cr>
noremap <silent><Leader>2 :call quickmenu#toggle(1)<cr><cr>
nnoremap <leader><leader>v :call PythonBriefNotesToggle()<cr>

" === Tab navigation with Alt+number ===
for c in range(1, 9)
    exec "set <A-".c.">=\e".c
    exec "map \e".c." <A-".c.">"
    let n = c - '0'
    exec "map <M-". n ."> ". n ."gt"
endfor

" === Window navigation (КРИТИЧНО!) ===
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" === Toggle GUI elements (gvim only) ===
if g:is_gui
    nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
    nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
    nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
endif

" === Tasks wiki quick access ===
if g:is_win
    command! T :tabnew ~/Documents/vimwiki/tech.wiki/tasks.wiki
else
    command! T :tabnew /home/st/MegaLinux/tech.wiki/tasks.wiki
endif

" ══════════════════════════════════════════════════════════════════════════════
"  `\|||/´         MMM           \|/            www            __^__          ~
"   (o o)         (o o)          @ @           (O-O)          /(o o)\\        ~
"ooO_(_)_Ooo__ ooO_(_)_Ooo___oOO_(_)_OOo___oOO__(_)__OOo___oOO__(_)__OOo_____ ~
"_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|____ ~
"__|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_ ~
" ══════════════════════════════════════════════════════════════════════════════
