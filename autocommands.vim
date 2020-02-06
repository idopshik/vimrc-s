
autocmd FileType c autocmd BufWritePost <buffer> :SyntasticCheck make  "Иначе не ралботает. Юкомплитми мешает. Или окно сразу закрываектся"


" Это кидает ошибки. 
" autocmd InsertLeave * call SetUsLayout()
