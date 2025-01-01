

call plug#begin('~/AppData/Local/nvim/plugged')
" below are some vim plugins for demonstration purpose.
" add the plugin you want to use here.
" Plug 'joshdick/onedark.vim'
" Plug 'iCyMind/NeoSolarized'

" kdfjlug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
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



call plug#end()

set nomodeline


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

"   (o o)         (o o)          @ @           (O-O)          /(o o)\\        ~
"ooO_(_)_Ooo__ ooO_(_)_Ooo___oOO_(_)_OOo___oOO__(_)__OOo___oOO__(_)__OOo_____ ~
"_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|____ ~
"__|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_ ~
"_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|____ ~




