" ==========================================================
" functions.vim — пользовательские функции
" ==========================================================

function! InsertDate()
    execute "normal! i" . strftime("%Y-%m-%d %H:%M")
endfunction
nnoremap <leader>dt :call InsertDate()<CR>

function! EditVimrc()
    execute "edit ~/.vim_runtime/vimrcs/sammeln.vim"
endfunction
nnoremap <leader>ev :call EditVimrc()<CR>

function! ReloadVimrc()
    source ~/.vim_runtime/vimrcs/sammeln.vim
    echo "Vimrc reloaded!"
endfunction
nnoremap <leader>rv :call ReloadVimrc()<CR>

function! ToggleRelNumber()
    if &relativenumber
        set norelativenumber
    else
        set relativenumber
    endif
endfunction
nnoremap <leader>rn :call ToggleRelNumber()<CR>
