" ==========================================================
" keymaps.vim — твои оригинальные маппинги
" ==========================================================

" Leader (оставляем как у тебя было, запятая)
let mapleader = ","
let maplocalleader = "\<Space>"

" ---------------- Навигация по окнам/буферам ----------------
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <C-Tab> :bn<CR>

" ---------------- NERDTree ----------------
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" ---------------- Tagbar ----------------
nnoremap <F9> :TagbarToggle<CR>

" ---------------- Fugitive ----------------
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git pull<CR>
nnoremap <leader>gb :Git blame<CR>

" ---------------- FZF ----------------
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :Helptags<CR>

" ---------------- Vimwiki ----------------
nnoremap <leader>wp <Plug>VimwikiDiaryPrevDay
nnoremap <leader>wn <Plug>VimwikiDiaryNextDay

" ---------------- Vimspector ----------------
nnoremap <leader>db <Plug>VimspectorBreakpoints
nnoremap <leader>dt <Plug>VimspectorToggleBreakpoint
nnoremap <leader>dc :call vimspector#ClearBreakpoints()<CR>
