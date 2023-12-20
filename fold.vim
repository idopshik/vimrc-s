"     EXAMPLES
"     :setlocal foldmethod=marker "example how to set localy
"     :autocmd BufRead /path/to/file setlocal foldmethod=marker " For particular file(s)
"      autocmd FileType vimwiki set foldmethod=syntax  - ЧАС убил, не работает гадость.
"      - только это помогло.
"      %% vim: foldmethod=syntax
"      vimwiki убила во мне всё человеческое. Единственное - вставить в сам файл. НИКАКИЕ
"      автокомнды не прокатывают.
"Всё что понял часа за четыре. Навреное, "какой-то плагин" не даёт работать. Без плагинов
"нет таких прогонов со складками.
"Автокоманды по складкам НЕ работают.

" Вот эта строчка как будто игнорируется на некоторых расширениях
set fdm=syntax 

au FileType vimwiki map <buffer> F :set foldmethod=syntax<cr>   "as example

augroup filetype_vim
    autocmd!
    " Это примеры. Для этого типа используется fdm=expr задан через
    " /.vim/after/ftplugin/vim/fold.vim
    autocmd FileType vim set foldlevelstart=2
augroup END

"Для си,по FileType работает, а для питона и html - Нет
autocmd FileType c setlocal foldmethod=indent
autocmd FileType python setlocal foldmethod=indent
autocmd FileType py setlocal foldmethod=indent


" Для HTML работает только по расширению. По FileType - нет
autocmd BufRead *.html setlocal foldmethod=indent

" less FOLDs: (overriden by file's sets. basic.vim Saving cursor position thing.)
set foldlevel=4
