" plugins_config/vim_only.vim — Конфигурация для Vim-specific плагинов
" ══════════════════════════════════════════════════════════════════════════════

" === Vim-specific настройки терминала ===
if has('terminal')
    " Терминал настройки для Vim (не Neovim)
    set termwinsize=15x0
endif

" === Balloons (только Vim) ===
if has('balloon_eval')
    set ballooneval
    set balloonevalterm
endif
