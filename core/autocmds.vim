" core/autocmds.vim — Autocommands
" ══════════════════════════════════════════════════════════════════════════════

augroup AutoGroup
    autocmd!
    
    " === Автосохранение view (folds, cursor position) ===
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
    
    " === Автоматический shebang для новых скриптов ===
    autocmd BufNewFile *.sh 0put =\"#!/bin/bash\<nl>\"|$
    autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python3\<nl># -*- coding: utf-8 -*-\<nl>\"|$
    
    " === Удаление trailing whitespace при сохранении ===
    " autocmd BufWritePre * %s/\s\+$//e
    
    " === Перечитывание файла если он изменился извне ===
    autocmd FocusGained,BufEnter * :checktime
    
    " === Highlight yanked text ===
    if exists('##TextYankPost')
        autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})
    endif
    
    " === Auto-resize splits when window resized ===
    autocmd VimResized * wincmd =
    
    " === Вернуться к последней позиции при открытии файла ===
    autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ | endif
    
    " === Help в вертикальном сплите ===
    autocmd FileType help wincmd L
    
    " === Quickfix: Enter открывает, q закрывает ===
    autocmd FileType qf nnoremap <buffer> <CR> <CR>
    autocmd FileType qf nnoremap <buffer> q :cclose<CR>
    
    " === Terminal: сразу в insert mode ===
    if has('nvim')
        autocmd TermOpen * startinsert
        autocmd TermOpen * setlocal nonumber norelativenumber
    endif
    
augroup END

" === Encrypted files ===
augroup EncryptedFiles
    autocmd!
    autocmd BufReadPre,FileReadPre *.gpg set nobackup
    autocmd BufReadPre,FileReadPre *.gpg set noswapfile
    autocmd BufReadPre,FileReadPre *.gpg set noundofile
    autocmd BufReadPre,FileReadPre *.gpg set nowritebackup
    autocmd BufReadPre,FileReadPre *.gpg set viminfo=
    autocmd BufReadPre,FileReadPre *.gpg set sh=/bin/bash
augroup END
