
autocmd FileType c autocmd BufWritePost <buffer> :SyntasticCheck make  "Без этого YC мешает или окно сразу закрывается

" Это кидает ошибки. 
" autocmd InsertLeave * call SetUsLayout()
"
function! DeleteInactiveBufs()
 "From tabpagebuflist() help, get a list of all buffers in all tabs
  let tablist = []
  for i in range(tabpagenr('$'))
    call extend(tablist, tabpagebuflist(i + 1))
  endfor
 
  "Below originally inspired by Hara Krishna Dara and Keith Roberts
 "http://tech.groups.yahoo.com/group/vim/message/56425
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



" https://mjj.io/2015/01/27/encrypting-files-with-gpg-and-vim/
" hacked to work with vimwiki and gpg2
" :sil => :h silent  :silent, :execute, and :sbuffer
augroup encrypted
  autocmd!
  autocmd BufReadPre,FileReadPre *.gpg,*.gpg.wiki setl noswapfile noundofile nobackup viminfo=
  autocmd BufReadPost *.gpg,*.gpg.wiki :sil %!GPG_TTY=/dev/tty gpg --decrypt 2> /dev/null
  autocmd BufWritePre *.gpg,*.gpg.wiki :sil %!GPG_TTY=/dev/tty gpg -e --default-recipient-self
  autocmd BufWritePost *.gpg,*.gpg.wiki :sil undo
augroup END

" Essentially, we disable auto-saving the .viminfo file, and then we disable swap files, undo files and backup files. After the buffer is read, we decrypt it with GPG, so that we are able to read the content in Vim. Before we eventually save our file, we encrypt the entire file with the user ID of the default key as the recipient of our message, and finally after writing the file we undo the last action, so that the file is still readable to us.

fun! WikiEncrypt()
    let filename=expand('%:t:r')
    let l:newfilename=filename.".gpg.wiki"
    
    let l:curdirname=expand('%:p:h')
    let l:tmpfilename=l:curdirname."/tmp_f"
    let l:finalfilename=l:curdirname . "/" . l:newfilename
    if expand('%:e')=='wiki'
        sil %!GPG_TTY=/dev/tty gpg -e --output tmp_f --default-recipient-self
            if rename(l:tmpfilename, l:newfilename) != 0
              echo "Unable to rename "
            else
                :call delete(expand('%')) | bdelete!
            endif
    endif
    redraw!
endfun

cmap we :call WikiEncrypt()<CR>
