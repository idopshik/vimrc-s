"=====================================================
"#   => Python settings
"=====================================================

autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
\ softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
\ formatoptions=crql
\ cindent cinkeys-=0# indentkeys-=0#
" первые пять -избыток это и в basic, и даже no-rc
" последняя строка для jedy

""""""""""""""""""""""""""""""
"#   => Golang section
"""""""""""""""""""""""""""""""
autocmd FileType go set omnifunc=go#complete#Complete

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

function! Auto_complete_string()
    if pumvisible()
        return "\<C-n>"
    else
        return "\<C-x>\<C-o>\<C-r>=Auto_complete_opened()\<CR>"
    end
endfunction

function! Auto_complete_opened()
    if pumvisible()
        return "\<Down>"
    end
    return ""
endfunction

inoremap <expr> <Nul> Auto_complete_string()
inoremap <expr> <C-Space> Auto_complete_string()

""""""""""""""""""""""""""""""
"#   => JavaScript section
"""""""""""""""""""""""""""""""
" To get correct comment highlighting
  autocmd FileType json syntax match Comment +\/\/.\+$+

""""""""""""""""""""""""""""""
"#   => Shell section
""""""""""""""""""""""""""""""
if exists('$TMUX')
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color
    endif
endif


""""""""""""""""""""""""""""""
"   => Twig section
""""""""""""""""""""""""""""""
autocmd BufRead *.twig set syntax=html filetype=html

"#   => Other filetype related autocommand (венегрет целый)
" --- HTML ---
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" --- template language support (SGML / XML too) ---
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd bufnewfile,bufread *.rhtml setlocal ft=eruby
autocmd BufNewFile,BufRead *.mako setlocal ft=mako
autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python
let html_no_rendering=1

" --- CSS ---
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" --- VimWiki ---

"#  Delete trailing whitespace on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
if has("autocmd")
    autocmd BufWritePre *.txt,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif



