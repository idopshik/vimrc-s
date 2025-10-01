" ==========================================================
" os/windows.vim — Windows-специфика
" ==========================================================

set shell=powershell
set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
set shellquote=\"
set shellpipe=\|
set shellredir=\|\ Out-File\ -Encoding\ UTF8\ %s
set shellxquote=

if executable('python3')
    let g:python3_host_prog = 'C:/Python311/python.exe'
endif

let g:vimspector_base_dir = expand('~/.vim_runtime/vimspector')
set termguicolors
