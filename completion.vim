"  +-----------------------------------------------------------+
"  |-----=== Completion and lang-support extentions ===--------|
"  +-----------------------------------------------------------+

" but if you open buff with these filetypes and return /
" /to your ft=go buffer - Coc wont't swithed off - you'll get conflict

"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install', 'for': ['json', 'javascript', 'html','vim' , 'css', 'htmljinja', 'jinja']}

"----------- ycm -----------------"
"python, c, c++, h only
"Plug 'Valloric/YouCompleteMe'

"pip3 install --user --upgrade pynvim     -после этого пропадёт ошибка при старте.
"Только потому, что за 2-3 дня не смог настроить ycm и coc для golang.

" Plug 'Shougo/deoplete.nvim'
" Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
" Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'

" ---------------=== Golang ===-------------------

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" ---------------=== Python ===-------------------
Plug 'davidhalter/jedi-vim'
Plug 'mitsuhiko/vim-jinja'              "" Jinja support for vim
Plug 'mitsuhiko/vim-python-combined'    "" Combined Python 2/3 for Vim
Plug 'vim-python/python-syntax'         "" это всё установлено, но я не работал с Python достаточно плотно для теста.
" Или установи pip insall black в venv или гугли. Без этого не будет работать AleFix

" ---------------=== Javascript ===-------------------
Plug 'pangloss/vim-javascript'               " better indentetion and highlighting
" post install (yarn install | npm install)
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'turbio/bracey.vim' " css,html,js live

" ---------------=== html ===-------------------
Plug 'mattn/emmet-vim'


"=====================================================
"#       Common completion options
"=====================================================

" set completeopt-=preview ""не показывать окно preview с документацией.



"=====================================================
"#       CoC  {{{
"=====================================================
" Производит много проблем.
" autocmd BufNew,BufEnter *.json,*.vim, *.js, *.html, *.css execute "silent! CocEnable"
" autocmd BufLeave *.py,*.go execute "silent! CocDisable"

" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c
"for coc-vimlsp
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
"Doesn't work for me. Way more inportant - gi - go inputed recently
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>



function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

    let g:airline#extensions#coc#enabled = 1
    let airline#extensions#coc#error_symbol = '⨉'
    let airline#extensions#coc#warning_symbol = '⚠'
    let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
    let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
"}}}
"=====================================================
"#       YouCompleteMe  {{{
"=====================================================
"""""newly recompiled YCM  (on my way. Haven't done "step3 for clang"
" let g:ycm_clangd_binary_path = "/path/to/clangd"
" You need to change /path/to/clangd with the path of binary you downloaded in step 3.



"special option, turned off YCM diagnostic display features. In feavour to Syntastic to
"work
"If you're using YCM's identifier completer in C-family languages but cannot use the clang-based
"semantic completer for those languages and want to use the GCC Syntastic checkers, unset this option.

" let g:ycm_show_diagnostics_ui = 0
" nmap <leader>g :YcmCompleter GoTo<CR>   "Это делает и джеди
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>


let g:ycm_autoclose_preview_window_after_completion=0

let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=-1

let g:ycm_filetype_whitelist = {'python': 1, 'c': 1, 'cpp': 1, 'h': 1}
"redundant
let g:ycm_filetype_blacklist = { 'go': 1 }

" to bored with hover feature
let g:ycm_auto_hover = ''
" Не для этого места в Keymap. Не могу настроить вызов по команде.
" Если что, включу, но не думаю. Отвлекает.

"css - for Coc
" let g:ycm_semantic_triggers = {
   " \   'css': [ 're!^\s{4}', 're!:\s+' ],
   " \ }
   "w/o whis css completion isn't working
"let g:ycm_semantic_triggers = {
"    \   'css': [ 're!^', 're!^\s+', ': ' ],
"    \   'scss': [ 're!^', 're!^\s+', ': ' ],
"    \ }




"=====================================================
"#       Deoplete
"=====================================================

let g:deoplete#enable_at_startup = 0  " 0 is default anyway
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/home/st/go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" autocmd FileType go call deoplete#enable() (для питона выключен, включается только по
" расширению , как и выключается coc.

"=====================================================
"       Completion overlap resolving !
"=====================================================

"-----------coc/ycm overlap-----------------"
"Errors and warnings can be suppressed via the :silent!
"Errors WILL happen since coc not always goint to be loaded at all
autocmd BufNew,BufEnter *.py,*.cpp,*.c,*.h silent! CocDisable
autocmd BufLeave *.py,*.cpp,*.c,*.h silent! CocEnable

"-------- Coc/deoplete overlap----------
autocmd BufNew,BufEnter *.go silent! execute "call deoplete#enable() | CocDisable"
autocmd BufLeave *.go silent! execute "call deoplete#disable()"

"-------- deoplete/ycm overlap----------
"Не перекрываются. deoplete работате только на go
