" plugins_config/coc.vim — Конфигурация COC.NVIM
" ══════════════════════════════════════════════════════════════════════════════
" После установки выполни:
"   :CocInstall coc-pyright coc-json coc-tsserver coc-clangd coc-html coc-css
" ══════════════════════════════════════════════════════════════════════════════

" === Базовые настройки ===
set updatetime=300
set signcolumn=yes

" Не передавать сообщения в |ins-completion-menu|
set shortmess+=c

" === TAB для completion ===
" Tab выбирает следующий вариант, Shift-Tab — предыдущий
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Enter подтверждает выбор
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Ctrl-Space вызывает completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" === Навигация по диагностике ===
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" === GoTo навигация (КРИТИЧНО!) ===
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" === K показывает документацию ===
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" === Highlight при удержании курсора ===
autocmd CursorHold * silent call CocActionAsync('highlight')

" === Rename (F2 или <leader>rn) ===
nmap <leader>rn <Plug>(coc-rename)
nmap <F2> <Plug>(coc-rename)

" === Code actions ===
nmap <leader>ca <Plug>(coc-codeaction-cursor)
nmap <leader>cs <Plug>(coc-codeaction-source)
nmap <leader>qf <Plug>(coc-fix-current)

" === Format ===
xmap <leader>cf <Plug>(coc-format-selected)
nmap <leader>cf <Plug>(coc-format)

" === Refactor ===
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" === CodeLens ===
nmap <leader>cl <Plug>(coc-codelens-action)

" === Text objects для функций/классов ===
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" === Scroll в float окнах ===
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" === Selection ranges ===
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" === Команды ===
command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" === Statusline интеграция ===
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" === CocList mappings ===
" Показать все диагностики
nnoremap <silent><nowait> <leader>cd :<C-u>CocList diagnostics<cr>
" Показать extensions
nnoremap <silent><nowait> <leader>ce :<C-u>CocList extensions<cr>
" Показать commands
nnoremap <silent><nowait> <leader>cc :<C-u>CocList commands<cr>
" Outline документа
nnoremap <silent><nowait> <leader>co :<C-u>CocList outline<cr>
" Symbols в workspace
nnoremap <silent><nowait> <leader>cw :<C-u>CocList -I symbols<cr>

" === Airline интеграция ===
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = '✗'
let airline#extensions#coc#warning_symbol = '⚠'
