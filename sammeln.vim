"env var GO exists (manually created)
    if $MINIGO
        source ~/.vim_runtime/vimrcs/golang/minigo.vim
    else
        set runtimepath+=~/.vim_runtime
        source ~/.vim_runtime/vimrcs/basic.vim
        source ~/.vim_runtime/vimrcs/basic2.vim

"    => Plug loading started here
        filetype off

        let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
        if empty(glob(data_dir . '/autoload/plug.vim'))
          silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
          autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif

        call plug#begin('~/.vim/plugged')

        if $GO
          source ~/.vim_runtime/vimrcs/golang/go_completion.vim
        else
          source ~/.vim_runtime/vimrcs/completion.vim
        endif

        source ~/.vim_runtime/vimrcs/extended_pre.vim
        source ~/.vim_runtime/vimrcs/extended.vim

"    => End of Plug loading
        call plug#end()
        filetype on
    
        source ~/.vim_runtime/vimrcs/filetypes.vim
        source ~/.vim_runtime/vimrcs/plugins_config.vim
        source ~/.vim_runtime/vimrcs/keymap.vim
        source ~/.vim_runtime/vimrcs/quickmenu.vim
        source ~/.vim_runtime/vimrcs/autocommands.vim
        source ~/.vim_runtime/vimrcs/fold.vim
        source ~/.vim_runtime/vimrcs/styling.vim

   endif
