" ==========================================================
" plugins/misc.vim — вспомогательные плагины
" ==========================================================

" Vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
nnoremap <leader>ww :VimwikiIndex<CR>
nnoremap <leader>wt :VimwikiTabIndex<CR>
nnoremap <leader>ws :VimwikiUISelect<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'snips']

" Fugitive
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git pull<CR>
nnoremap <leader>gb :Git blame<CR>

" Ack/FZF
nnoremap <leader>a :Ack!<Space>
if executable('fzf')
  nnoremap <C-p> :Files<CR>
  nnoremap <leader>f :Rg<CR>
endif

" Surround и Commentary работают без доп. настроек
