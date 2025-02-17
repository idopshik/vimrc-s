
function! CLEAN740()
    g!/\( 740 \)\|\( 760 \)/d
    %s/     Channel: 0//g
    %s/Timestamp: 173/   /g
endfunction

command Clean740 call CLEAN740()
" And just do :Clean740<cr>
