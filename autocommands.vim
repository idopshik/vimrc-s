
autocmd FileType c autocmd BufWritePost <buffer> :SyntasticCheck make  "Без этого YC мешает или окно сразу закрывается

" Это кидает ошибки. 
" autocmd InsertLeave * call SetUsLayout()
