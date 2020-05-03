filetype off                  " required
call plug#begin('~/.vim/plugged')

"## ------------------=== Other ===----------------------

"Just trying it
Plug 'christoomey/vim-tmux-navigator'

"sudo apt-get install wmctrl    # Ubuntu/Debian - needed. Terminal dosn't execute ctrl+<CR>
Plug 'lambdalisue/vim-fullscreen'          "Ctrl + <CR> (does) :FullscreenToggle  On linux only.

Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-surround'               " Parentheses, brackets, quotes, XML tags, and more
Plug 'xolox/vim-misc'                   " required
Plug 'scrooloose/nerdcommenter'         " :help nerdcommenter
Plug 'godlygeek/tabular'
Plug 'tmhedberg/simpylfold'             " No-BS Python code folding for Vim
" Plug 'jiangmiao/auto-pairs'           " :h autopairs  Как же она затрахала

Plug 'mhinz/vim-startify'               " Nice start screen (COW)
Plug 'mbbill/undotree'                   

Plug 'junegunn/goyo.vim' " :Goyo

"## --------------=== Snippets support ===---------------
Plug 'sirver/ultisnips'                 "doesn't come with any snippets itself
Plug 'honza/vim-snippets'               "commn snippets. Not enough.
" Plug 'garbas/vim-snipmate'              " Snippets manager. Additional snippets.
" Plug 'MarcWeber/vim-addon-mw-utils'     " dependencies #1
" Plug 'tomtom/tlib_vim'                  " dependencies #2

"## --------------=== Code/project navigation ===-------------
Plug 'luochen1990/rainbow'   "colorful paranpheses
Plug 'skywind3000/quickmenu.vim'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
":h fzf-vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'fisadev/FixedTaskList.vim'        " Pending tasks list
Plug 'ap/vim-css-color'


Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

"pip3 install --user --upgrade pynvim     -после этого пропадёт ошибка при старте.
Plug 'Shougo/deoplete.nvim'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

"либо так либо не иначе
let g:deoplete#enable_at_startup = 1
" autocmd FileType go call deoplete#enable()


set completeopt-=preview
" as alternative" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:deoplete#sources#go#gocode_binary = $GOPATH.'/home/st/go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" вот с этим не работает
 " let g:deoplete#sources#go = ['vim-go']
 " let g:deoplete#sources#go#gocode_binary = '/dev/null'
 " call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*', })







"
"## --------------=== Git Integration====-----------------
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter' "
Plug 'junegunn/gv.vim'       "commit browser. :GV

"## --------------=== Colorschemes====-----------------
Plug 'NLKNguyen/papercolor-theme'
Plug 'AlessandroYorba/Sierra'
Plug 'arcticicestudio/nord-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'mhartington/oceanic-next'
Plug 'ajh17/spacegray.vim'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'haishanh/night-owl.vim'

Plug 'ryanoasis/vim-devicons' "очень спорные иконки.
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"
call plug#end() " }}}
"===================================================== #      Path's (по системам) {{{
"=====================================================

let g:UltiSnipsSnippetDirectories=[$HOME.'/Dropbox/.vim_cloud/vim-snippets/UltiSnips']

let g:vimwiki_list = [
                        \{'path': '~/Dropbox/.vim_cloud/vimwiki/tech.wiki',
                        \ 'template_path': '~/Dropbox/.vim_cloud/vimwiki/templates',
                        \ 'template_default': 'default',
                        \ 'template_ext': '.html' },
                        \{'path': '~/Dropbox/.vim_cloud/vimwiki/personal.wiki'}
                \]

"=====================================================
"#    Other sections
"=====================================================

"=====================================================
"#    Style
"=====================================================
set background=dark
set t_Co=256

" TMUX
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"#   Font
"=====================================================
set guifont=Iosevka\ Expanded\ 19
let g:solarized_termcolors=256

colorscheme spacegray

"must be here. AFTER colorscheme set up"
hi lCursor guibg=#00ff00          "highlight green cursor when keymap activated
"=====================================================
"#    Folding
"=====================================================
set fdm=syntax 
au FileType vimwiki map <buffer> F :set foldmethod=syntax<cr>   "as example

augroup filetype_vim
    autocmd!
    autocmd FileType vim set foldlevelstart=0
augroup END

set foldlevel=4
"=====================================================
"#    Go filetype
"=====================================================
autocmd FileType go set omnifunc=go#complete#Complete

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
"=====================================================
"#    Autocommands
"=====================================================

function! DeleteInactiveBufs()
 "From tabpagebuflist() help, get a list of all buffers in all tabs 
  let tablist = []
  for i in range(tabpagenr('$'))
    call extend(tablist, tabpagebuflist(i + 1))
  endfor
 
  "Below originally inspired by Hara Krishna Dara and Keith Roberts
 "http://tech.groups.yahoo.com/group/vim/message/56425
  let nWipeouts = 0
  for i in range(1, bufnr('$'))
    if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
      "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
     silent exec 'bwipeout' i
     let nWipeouts = nWipeouts + 1
   endif
 endfor
 echomsg nWipeouts . ' buffer(s) wiped out'
endfunction

command! Ball :call DeleteInactiveBufs()


"Prevent Vim from clearing the clipboard on exit
autocmd VimLeave * call system("xsel -ib", getreg('+'))

