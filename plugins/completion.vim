" plugins/completion.vim — Completion плагины (COC.NVIM)
" ══════════════════════════════════════════════════════════════════════════════
" Требует: Node.js (https://nodejs.org/)
" После установки выполни: :CocInstall coc-pyright coc-json coc-tsserver
" ══════════════════════════════════════════════════════════════════════════════

" === COC.NVIM (главный completion engine) ===
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" === Golang ===
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" === Python ===
Plug 'vim-python/python-syntax'           " Улучшенный syntax highlighting
Plug 'Vimjas/vim-python-pep8-indent'      " Правильные отступы по PEP8
" jedi-vim больше не нужен — pyright через coc лучше

" === JavaScript/TypeScript ===
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'       " TypeScript syntax

" === HTML/CSS ===
Plug 'mattn/emmet-vim'

" === Старые плагины — УДАЛЕНЫ ===
" YouCompleteMe — не работает в Neovim на Windows
" jedi-vim — заменён на coc-pyright
" syntastic — заменён на coc diagnostics
" vim-flake8 — заменён на ruff через coc
" vim-isort — заменён на ruff через coc
