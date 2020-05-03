"env var GO exists (manually created)
    if $MINIGO
      source ~/.vim_runtime/vimrcs/golang/minigo.vim
    else
      set runtimepath+=~/.vim_runtime
      source ~/.vim_runtime/vimrcs/basic.vim

      if $GO
          source ~/.vim_runtime/vimrcs/golang/go_completion.vim
      else
          source ~/.vim_runtime/vimrcs/completion.vim
      endif

      source ~/.vim_runtime/vimrcs/filetypes.vim
      source ~/.vim_runtime/vimrcs/plugins_config.vim
      source ~/.vim_runtime/vimrcs/extended.vim
      source ~/.vim_runtime/vimrcs/styling.vim
      source ~/.vim_runtime/vimrcs/keymap.vim
      source ~/.vim_runtime/vimrcs/quickmenu.vim
      source ~/.vim_runtime/vimrcs/autocommands.vim
      source ~/.vim_runtime/vimrcs/fold.vim
   endif
