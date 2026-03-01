" plugins/completion.vim — Completion плагины (COC.NVIM)
" ══════════════════════════════════════════════════════════════════════════════
" Требует: Node.js (https://nodejs.org/)
" После установки выполни: :CocInstall coc-pyright coc-json coc-tsserver
" ══════════════════════════════════════════════════════════════════════════════

" plugins/completion.vim
" COC работает на Vim 8.1.1719+ и Neovim 0.4+

" Проверка: Vim 8.1.1719+ ИЛИ Neovim
let s:coc_supported = g:is_nvim || (v:version >= 801 && has('patch1719'))

if s:coc_supported && executable('node')
    " === COC для современных редакторов ===
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
else
    " === Fallback: старый стек ===
    Plug 'davidhalter/jedi-vim'
    Plug 'dense-analysis/ale'
endif

" Общие
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

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
