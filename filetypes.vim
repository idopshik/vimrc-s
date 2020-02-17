au BufRead,BufNewFile *.R set filetype=r
au BufRead,BufNewFile *.r set filetype=r

"=====================================================
"#   => Python settings
"=====================================================

" highlight 'long' lines (>= 80 symbols) in python files
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    " autocmd FileType python,rst,c,cpp match Excess /\%81v.*/
    "match Error /\%81v.\+/  "Бескопромисное решение"
    ""set colorcolumn+80     "Серенькая полосочка
   "I dont like ruler.
    autocmd FileType python,rst,c,cpp set nowrap

augroup END
  " Select flake8 and pylint, and ignore pylint, so only flake8 is run.
  " let g:ale_linters = {'python': [ 'pylint']} just doesn' work out at all!

" Jedy
let g:jedi#completions_command = "<C-N>" "omnicompletion to <C-N> instead of <Ctrl-Space>
"uncomment in order to not let jedi show docstrings
"autocmd FileType python set completeopt-=preview
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
\  softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
" Пытаюсь решить пробему с джеди - с открытием нового окна "
py3 import os; sys.executable=os.path.join(sys.prefix, 'python.exe')
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def
au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#

function! s:GetVisualSelection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][:col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction
"autocmd for Visual mode
autocmd FileType python vnoremap <buffer> <F9> :<C-U>exec '!clear;  python' shellescape(<SID>GetVisualSelection(), 1)<CR>

""""""""""""""""""""""""""""""
"#   => JavaScript section
"""""""""""""""""""""""""""""""
" let javascript_enable_domhtmlcss=1
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd BufNewFile,BufRead *.json setlocal ft=javascript

" au FileType javascript call JavaScriptFold()
" au FileType javascript setl foldenable
" au FileType javascript setl nocindent

" au FileType javascript imap <c-t> $log();<esc>hi
" au FileType javascript imap <c-a> alert();<esc>hi

" au FileType javascript inoremap <buffer> $r return
" au FileType javascript inoremap <buffer> $f // --- PH<esc>FP2xi

" function! JavaScriptFold()
    " setl foldmethod=syntax
    " setl foldlevelstart=1
    " syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    " function! FoldText()
        " return substitute(getline(v:foldstart), '{.*', '{...}', '')
    " endfunction
    " setl foldtext=FoldText()
" endfunction


""""""""""""""""""""""""""""""
"#   => CoffeeScript section
"""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
au FileType coffee call CoffeeScriptFold()

au FileType gitcommit call setpos('.', [0, 1, 1, 0])


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
let g:closetag_default_xml=1
let g:sparkupNextMapping='<c-l>'
autocmd FileType html,htmldjango,htmljinja,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako source ~/.vim/plugged/closetag.vim/plugin/closetag.vim

" --- CSS ---
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

"
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



