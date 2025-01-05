
"не помогает. вим не видит pyhton похоже. А ниовим работате.
"let &pythonthreedll = 'C:\Users\st\AppData\Local\Programs\Python\Python312\python312.dll'

call plug#begin('~/AppData/Local/nvim/plugged')
" below are some vim plugins for demonstration purpose.
" add the plugin you want to use here.
" Plug 'joshdick/onedark.vim'
" Plug 'iCyMind/NeoSolarized'



Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'RRethy/vim-illuminate' "auto-highlighting under cursor
Plug 'airblade/vim-rooter'
Plug 'majutsushi/tagbar'
"---------===== Search with ACK ======---------------"
Plug 'mileszs/ack.vim'     "Возможно fzf-vim перекрывает этот плагин.

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'  " :GV должна рисовать график. А выдаёт лишь список. но хоть так.
Plug 'airblade/vim-gitgutter'

Plug 'rhysd/git-messenger.vim'               "открывает окно по <leader>gm
let g:git_messenger_close_on_cursor_moved = v:false " иначе мелькает и всё.
let g:git_messenger_always_into_popup = v:true

Plug 'idanarye/vim-merginal'               "git branch diff tool

Plug 'mhinz/vim-startify'               " Nice start screen (COW)
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
":h fzf-vim
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'fisadev/FixedTaskList.vim'        " Pending tasks list

Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }




Plug 'skywind3000/asyncrun.vim'

















call plug#end()

set number                     " Show current line number
set relativenumber             " Show relative line numbers

set belloff=all

set nomodeline

set splitbelow  "снизу. В том числе fugiteve

set background=dark
"colorscheme gruvbox
colorscheme moonfly

nnoremap <Leader>a :Ack<CR> " поиск слова под курсором. Мощнейший ack.

map <C-n> :NERDTreeToggle<CR>

nnoremap <leader>nn :NERDTreeFind<CR>


" map <alt+n> to navigate through tabs (redundant for me)
for c in range(1, 9)
 "    exec "set <A-".c.">=\e".c
 "    exec "map \e".c." <A-".c.">"


    let n = c - '0'
    exec "map <M-". n ."> ". n ."gt"
endfor

"#        Window's
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <F8> : !gcc % && .\a.out <CR>

"   (o o)         (o o)          @ @           (O-O)          /(o o)\\        ~
"ooO_(_)_Ooo__ ooO_(_)_Ooo___oOO_(_)_OOo___oOO__(_)__OOo___oOO__(_)__OOo_____ ~
"_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|____ ~
"__|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_ ~
"_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|____ ~

"et guicursor=n-v-c-i:block-Cursor

"cursore block
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast

" open quickfix window automatically when AsyncRun is executed
" set the quickfix window 6 lines height.
let g:asyncrun_open = 6

" ring the bell to notify you job finished
let g:asyncrun_bell = 1
nmap <F9> :TagbarToggle<CR>

" F10 to toggle quickfix window
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

map <F3> :w <CR> :!g++ % -o %< <CR>:vert term ./%<<CR>
nnoremap <silent> <F4> :AsyncRun -cwd=$(VIM_FILEDIR) -mode=4 "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
noremap <silent> <F5> :w <CR> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
noremap <silent> <F6> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
