
"  +-----------------------------------------------------------+
"  |--------------=== Partial completion ===-------------------|
"  +-----------------------------------------------------------+

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

let g:deoplete#sources#go#gocode_binary = $GOPATH.'/home/st/go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']


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
