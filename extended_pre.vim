
"Plug 'michal-h21/vim-zettel'

Plug 'lambdalisue/vim-fullscreen'          "Ctrl + <CR> (does) :FullscreenToggle  On linux only.
Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-startify'               " Nice start screen (COW)
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
":h fzf-vim
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'fisadev/FixedTaskList.vim'        " Pending tasks list

"TODO если оставишь, добавь поддрежку windows здесь
        "let g:vimwiki_list = [
        "                        \{'path': '~/Dropbox/.vim_cloud/vimwiki/tech.wiki',
        "                        \ 'template_path': '~/Dropbox/.vim_cloud/vimwiki/templates',
        "                        \ 'template_default': 'default',
        "                        \ 'template_ext': '.html' },
        "                        \{'path': '~/Dropbox/.vim_cloud/vimwiki/personal.wiki'}
        "                \]
        "Потому что на рабочем компьютере нет дропбокс, а tech wiki надо.
        let g:vimwiki_list = [
                                \{'path': '/home/st/MegaLinux/tech.wiki',
                                \ 'template_path': '~/Dropbox/.vim_cloud/vimwiki/templates',
                                \ 'template_default': 'default',
                                \ 'template_ext': '.html' },
                                \{'path': '~/Dropbox/.vim_cloud/vimwiki/personal.wiki'}
                        \]
