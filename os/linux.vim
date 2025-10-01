" ==========================================================
" os/linux.vim — Linux-специфика
" ==========================================================

set shell=/bin/bash

if executable('python3')
    let g:python3_host_prog = '/usr/bin/python3'
endif

set termguicolors
