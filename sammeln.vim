"env var GO exists (manually created)
    if $MINIGO
        source ~/.config/nvim/vimrc-s/golang/minigo.vim
    else
        set runtimepath+=~/.vim_runtime
        source ~/.config/nvim/vimrc-s/basic.vim
        source ~/.config/nvim/vimrc-s/basic2.vim

"    => Plug loading started here
        filetype off
        call plug#begin('~/.nvim/plugged')

        if $GO
          source ~/.config/nvim/vimrc-s/golang/go_completion.vim
        else
          source ~/.config/nvim/vimrc-s/completion.vim
        endif

        source ~/.config/nvim/vimrc-s/extended_pre.vim
        source ~/.config/nvim/vimrc-s/extended.vim

"    => End of Plug loading
        call plug#end()
        filetype on
    
        source ~/.config/nvim/vimrc-s/filetypes.vim
        source ~/.config/nvim/vimrc-s/plugins_config.vim
        source ~/.config/nvim/vimrc-s/styling.vim
        source ~/.config/nvim/vimrc-s/keymap.vim
        source ~/.config/nvim/vimrc-s/quickmenu.vim
        source ~/.config/nvim/vimrc-s/autocommands.vim
        source ~/.config/nvim/vimrc-s/fold.vim


   endif
