" vim: foldmethod=marker

"formatoptions - got problem at least once after major wiping all configs. Restore partially.
"Сильно не вчитывался. При любых проблемых с переносами, комментами, чем угодно BLAME IT FIRST
                                                        "and ~/.vim/after/*  - SECOND
autocmd FileType python nmap <buffer> <Leader>f <plug>(BlackMacchiatoCurrentLine)
                                                        
autocmd BufNewFile,BufRead * setlocal formatoptions+=cqn
autocmd BufNewFile,BufRead * setlocal formatoptions+=cqn
" Чтобы по-умолчанию было выключено
autocmd VimEnter * TransparentDisable

"check if file changed outside
augroup auto_checktime
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold * silent! checktime
augroup end

" only by creation through :e and at first time saving and having shabang (!#)
augroup shebang_chmod  
  autocmd! 
  autocmd BufNewFile  * let b:brand_new_file = 1
  autocmd BufWritePost * unlet! b:brand_new_file
  autocmd BufWritePre *
        \ if exists('b:brand_new_file') |
        \   if getline(1) =~ '^#!' |
        \     let b:chmod_post = '+x' |
        \   endif |
        \ endif
  autocmd BufWritePost,FileWritePost *
        \ if exists('b:chmod_post') && executable('chmod') |
        \   silent! execute '!chmod '.b:chmod_post.' "<afile>"' |
        \   unlet b:chmod_post |
        \ endif
augroup END


function! DeleteInactiveBufs()
 "From tabpagebuflist() help, get a list of all buffers in all tabs 
  let tablist = []
  for i in range(tabpagenr('$'))
    call extend(tablist, tabpagebuflist(i + 1))
  endfor
 
  let nWipeouts = 0
  for i in range(1, bufnr('$'))
    if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
      "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
     silent exec 'bwipeout' i
     let nWipeouts = nWipeouts + 1
   endif
 endfor
 echomsg nWipeouts . ' buffer(s) wiped out'
endfunction

command! Ball :call DeleteInactiveBufs()
command! BAll :call DeleteInactiveBufs()

   
"## --------------=== Encrypted  ====-----------------
" Encryption gpg support
" :sil => :h silent  :silent, :execute, and :sbuffer
augroup encrypted
  autocmd!
  autocmd BufReadPre,FileReadPre *.gpg.wiki setl bin noswapfile noundofile nobackup viminfo=
  autocmd BufReadPost *.gpg.wiki execute "'[,']!gpg --decrypt --default-recipient-self 2> /dev/null"  |
    \ setlocal nobin |
    \ execute "doautocmd BufReadPost *.wiki"  

  autocmd BufWritePre *.gpg.wiki setl bin | :sil %!GPG_TTY=/dev/tty gpg -e --default-recipient-self
  autocmd BufWritePost *.gpg.wiki :sil undo | setl nobin
augroup END

" Essentially, we disable auto-saving the .viminfo file, and then we disable swap files, undo files and backup files. After the buffer is read, we decrypt it with GPG, so that we are able to read the content in Vim. Before we eventually save our file, we encrypt the entire file with the user ID of the default key as the recipient of our message, and finally after writing the file we undo the last action, so that the file is still readable to us.

fun! WikiEncrypt()
    lcd %:p:h "Возможное решение бага
    let filename=expand('%:t:r') 
    let l:newfilename=filename.".gpg.wiki"
    let l:curdirname=expand('%:p:h')
    let l:tmpfilename=l:curdirname."/tmp_f"

    if filereadable(l:newfilename)
        echom "=>     warning!  <="
        echo "File already exists!"
    elseif expand('%:e')=='wiki'
        setlocal bin 
        sil %!GPG_TTY=/dev/tty gpg -e --output tmp_f --default-recipient-self
        setlocal nobin
        "debug section (had a Unable to rename message for some reason!)
        " echo "curdirname  variable:"
        " echo curdirname
        " echo "filename  variable:"
        " echo filename
        " echo "tmpfilename variable:"
        " echo l:tmpfilename
        " echo "newfilename variable:"
        " echo l:newfilename
            if rename(l:tmpfilename, l:newfilename) != 0
              echo "Unable to rename "
            else
                call delete(expand('%')) | bdelete!
                echo "File encrypted (gpg async.). buf wiped."
            endif
    else
        echo "For VimWiki only!"
    endif
endfun

:command WikiEncrypt :call WikiEncrypt()

augroup NoApostrotheNames
    autocmd BufWriteCMD ' :echohl WarningMsg | echo " Apostrophe-names aren't allowed!" | echohl Non
augroup END

   
"## --------------=== Redir  ====-----------------

"`:Redir` followed by either shell or vim command
" command! -nargs=+ -complete=command Redir silent call Redir(<q-args>)

":Redir Комманда для перенаправления вывода в буфер
command! -nargs=+ -complete=command Redir let s:reg = @@ |
            \redir @"> | silent execute <q-args> | redir END |
            \new | pu | 1,2d_ | let @@ = s:reg


" autocmd FileType python map <buffer> <F12> :w<CR>:call Redirpython('!python3 '.expand('%'))<CR>

"this has a flow. Need to be fixed
function! Execpython(cmd)
    redir @x
    exec printf('silent %s',a:cmd)
    redir END
    tabnew
    norm "xp
endfunction

"Wonderfull! Open vertical split!
function! Redirpython(cmd)
  for win in range(1, winnr('$'))
    if getwinvar(win, 'scratch')
      execute win . 'windo close'
    endif
  endfor
  if a:cmd =~ '^!'
    let output = system(matchstr(a:cmd, '^!\zs.*'))
  else
    redir => output
    execute a:cmd
    redir END
  endif
  botright vnew
  let w:scratch = 1
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, split(output, "\n"))
endfunction

" Prevent Vim from clearing the clipboard on exit 
" (all linux apps do that! it's normal) 
" Have to use clipboard manager if you want win-like bahaviour
autocmd VimLeave * call system("xsel -ib", getreg('+'))


