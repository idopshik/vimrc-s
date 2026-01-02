" core/filetypes.vim — Filetype-специфичные настройки
" ══════════════════════════════════════════════════════════════════════════════

augroup FiletypeSettings
    autocmd!
    
    " === Python ===
    autocmd FileType python setlocal tabstop=4
    autocmd FileType python setlocal shiftwidth=4
    autocmd FileType python setlocal softtabstop=4
    autocmd FileType python setlocal expandtab
    autocmd FileType python setlocal autoindent
    autocmd FileType python setlocal fileformat=unix
    autocmd FileType python setlocal textwidth=88
    autocmd FileType python let python_highlight_all=1
    
    " === JavaScript/TypeScript ===
    autocmd FileType javascript,typescript,javascriptreact,typescriptreact setlocal tabstop=2
    autocmd FileType javascript,typescript,javascriptreact,typescriptreact setlocal shiftwidth=2
    autocmd FileType javascript,typescript,javascriptreact,typescriptreact setlocal softtabstop=2
    autocmd FileType javascript,typescript,javascriptreact,typescriptreact setlocal expandtab
    
    " === HTML/CSS ===
    autocmd FileType html,css,scss,less setlocal tabstop=2
    autocmd FileType html,css,scss,less setlocal shiftwidth=2
    autocmd FileType html,css,scss,less setlocal softtabstop=2
    autocmd FileType html,css,scss,less setlocal expandtab
    
    " === JSON ===
    autocmd FileType json setlocal tabstop=2
    autocmd FileType json setlocal shiftwidth=2
    autocmd FileType json setlocal softtabstop=2
    autocmd FileType json setlocal expandtab
    autocmd FileType json setlocal conceallevel=0
    
    " === YAML ===
    autocmd FileType yaml setlocal tabstop=2
    autocmd FileType yaml setlocal shiftwidth=2
    autocmd FileType yaml setlocal softtabstop=2
    autocmd FileType yaml setlocal expandtab
    
    " === Markdown ===
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal linebreak
    autocmd FileType markdown setlocal spell
    autocmd FileType markdown setlocal spelllang=en,ru
    autocmd FileType markdown setlocal conceallevel=0
    
    " === Vim ===
    autocmd FileType vim setlocal tabstop=4
    autocmd FileType vim setlocal shiftwidth=4
    autocmd FileType vim setlocal expandtab
    autocmd FileType vim setlocal foldmethod=marker
    
    " === Shell ===
    autocmd FileType sh,bash,zsh setlocal tabstop=4
    autocmd FileType sh,bash,zsh setlocal shiftwidth=4
    autocmd FileType sh,bash,zsh setlocal expandtab
    
    " === Go ===
    autocmd FileType go setlocal tabstop=4
    autocmd FileType go setlocal shiftwidth=4
    autocmd FileType go setlocal noexpandtab
    
    " === Makefile (tabs required) ===
    autocmd FileType make setlocal noexpandtab
    autocmd FileType make setlocal tabstop=4
    autocmd FileType make setlocal shiftwidth=4
    
    " === C/C++ ===
    autocmd FileType c,cpp setlocal tabstop=4
    autocmd FileType c,cpp setlocal shiftwidth=4
    autocmd FileType c,cpp setlocal expandtab
    
    " === Lua ===
    autocmd FileType lua setlocal tabstop=2
    autocmd FileType lua setlocal shiftwidth=2
    autocmd FileType lua setlocal expandtab
    
    " === Git commit ===
    autocmd FileType gitcommit setlocal spell
    autocmd FileType gitcommit setlocal textwidth=72
    
    " === Vimwiki ===
    autocmd FileType vimwiki setlocal wrap
    autocmd FileType vimwiki setlocal linebreak
    autocmd FileType vimwiki setlocal spell
    autocmd FileType vimwiki setlocal spelllang=en,ru
    
    " === Help ===
    autocmd FileType help setlocal nolist
    
    " === Quickfix ===
    autocmd FileType qf setlocal nobuflisted
    
augroup END

" === File associations ===
augroup FileAssociations
    autocmd!
    autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact
    autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
    autocmd BufNewFile,BufRead *.conf set filetype=conf
    autocmd BufNewFile,BufRead *.wiki set filetype=vimwiki
    autocmd BufNewFile,BufRead .env* set filetype=sh
    autocmd BufNewFile,BufRead Dockerfile* set filetype=dockerfile
    autocmd BufNewFile,BufRead *.nginx set filetype=nginx
    autocmd BufNewFile,BufRead nginx.conf set filetype=nginx
augroup END
