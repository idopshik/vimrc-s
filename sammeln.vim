"env var GO exists (manually created)
    if $GO
      set runtimepath+=~/.vim_runtime
      source ~/.vim_runtime/vimrcs/basic.vim
      source ~/.vim_runtime/vimrcs/golang/extended.vim
      source ~/.vim_runtime/vimrcs/keymap.vim
      source ~/.vim_runtime/vimrcs/golang/plugins_config.vim
      source ~/.vim_runtime/vimrcs/quickmenu.vim
    elseif $MINIGO
      source ~/.vim_runtime/vimrcs/golang/minigo.vim
    else
      set runtimepath+=~/.vim_runtime
      source ~/.vim_runtime/vimrcs/filetypes.vim
      source ~/.vim_runtime/vimrcs/plugins_config.vim
      source ~/.vim_runtime/vimrcs/extended.vim
      source ~/.vim_runtime/vimrcs/completion.vim
      source ~/.vim_runtime/vimrcs/basic.vim
      source ~/.vim_runtime/vimrcs/styling.vim
      source ~/.vim_runtime/vimrcs/keymap.vim
      source ~/.vim_runtime/vimrcs/quickmenu.vim
      source ~/.vim_runtime/vimrcs/autocommands.vim
      source ~/.vim_runtime/vimrcs/fold.vim
   endif
