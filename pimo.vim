
"=====================================================
"" Pimodoro
"=====================================================
"
""This plugin relies on the pomodoro technique steps.
""
""    Decide on a task to complete.
""    Set the pomodoro timer. Usually, this is 25 minutes. The act of setting the timer is important, and so there is no default timer value.
""    Work on the task. You must explicitly start the task to again reinforce the importance of starting. If work is interrupted, you should complete the interruption, set a reminder, or reset the current timer in that order of preference.
""    Stop what you were doing when the timer completes. Mark down a checkmark.
""    If you have less than four checkmarks, take a 3-5 minute break then go to step 2.
""    If you have four checkmarks, take a 15-30 minute break then go to step 1.

let g:pim#taskfile='~/Yandex.Disk/.vim_cloud/vimwiki/personal.wiki/tasks.wiki'

function! PimodoroBreak()
   :call pim#check_off()
   :call pim#start_break("1m") "30sec 
endfunction

function! OnPimWorkFinish()
  echom system("notify-send -u critical -i 'notification-message-IM' 'POMODORO FINISHED !!' 'tee time'")
  echom system("mpg123 -q ~/.vim_runtime/vimrcs/pim_1.mp3")

:call confirm ("Tee time! Enough PC by now!")

  " Compose msg for break
"let l:msg = 'pomodoro is finished!'
"let l:msg_normal_break = 'check off and bread 10 min?'
"let l:msg_reward = 'Now would you break for 25 minutes?'
"   
"let choice = confirm(l:msg . l:msg_normal_break, "&Yes\n&Manual\nSkip Break", 1)
"
"if choice == 1
"    :call PimodoroBreak()
"elseif choice == 2
"    :call pim#start_work()
"    echom "was 2"
"else
"    echom "was 3"
"    :call pim#set_timer('1m')
"    endif
endfunction

function! PimodoroSet()

    :call pim#set_timer("1m")

    :call pim#start_work()

    echom system("mpg123 -q ~/.vim_runtime/vimrcs/pim_1.mp3")
endfunction

function! PimodoroTask()
    :call pim#set_reminder()
endfunction

function! OnPimBreakFinish()
    echom system("notify-send -u critical -i 'notification-message-im' 'how about some tomatoes?' 'dont be lazy'")
    echom system("mpg123 -q ~/.vim_runtime/vimrcs/pim_3.mp3")

    :call confirm ("Break finished! Working time now!")

     " Compose msg for break
    let l:msg = 'Pause over. '
    let l:msg_normal = 'Start pomodoro?'

    let choice = confirm(l:msg . l:msg_normal, "&Yes\n&No", 1)

    if choice == 1
        :call PimodoroSet()
    endif
endfunction

function! Pomo()
    echom 'Pomodoro menu'
    while 1
        let choice = inputlist(['1. set_task', '2. set timer and start work', '3. check_off and set_break', '4. interrupt', '5. mark interruption', '6. void_set'])
        if choice == 0 || choice > 6
            break
        elseif choice == 1
            :call pim#set_task()
        elseif choice == 2
            :call PimodoroSet()
        elseif choice == 3
            " :call pim#check_off()
            :call PimodoroBreak()
        elseif choice == 4
            :call pim#interrupt()
        elseif choice == 5
            :call pim#mark_interruption()
        elseif choice == 6
            :call pim#void_set()
        endif
        break
    endwhile
endfunction


nnoremap <leader>z :call Pomo()<CR>
