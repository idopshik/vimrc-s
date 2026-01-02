" plugins/completion.vim — Completion плагины
" ══════════════════════════════════════════════════════════════════════════════

" === YouCompleteMe (python, c, c++, h) ===
Plug 'Valloric/YouCompleteMe'

" === Golang ===
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" === Python ===
Plug 'davidhalter/jedi-vim'
Plug 'mitsuhiko/vim-jinja'
Plug 'mitsuhiko/vim-python-combined'
Plug 'vim-python/python-syntax'

" === Javascript ===
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'turbio/bracey.vim'

" === HTML ===
Plug 'mattn/emmet-vim'
