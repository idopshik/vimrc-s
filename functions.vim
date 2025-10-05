" functions.vim
function! CompileAndRun()
  if &filetype ==# 'python'
    execute '!python3 %'
  elseif &filetype ==# 'c'
    execute '!gcc % -o %< && ./%<'
  endif
endfunction
