" platform/windows.vim — Настройки для Windows
" ══════════════════════════════════════════════════════════════════════════════

" === Пути для backup/swap/undo ===
set backupdir=~\_vim\backup
set backupdir+=.

set directory=$HOME\_vim\swapfiles
set directory+=.

set undodir=$HOME\_vim\undodir
set undodir+=.

set backup
set swapfile
set undofile

" Создаём директории
call MakeDirIfNoExists($HOME . '/_vim/backup')
call MakeDirIfNoExists($HOME . '/_vim/swapfiles')
call MakeDirIfNoExists($HOME . '/_vim/undodir')

" === Python ===
" Укажи свой путь к Python если отличается
if isdirectory('C:\Python312')
    let &pythonthreehome = 'C:\Python312'
    let &pythonthreedll = 'C:\Python312\python312.dll'
elseif isdirectory('C:\Python311')
    let &pythonthreehome = 'C:\Python311'
    let &pythonthreedll = 'C:\Python311\python311.dll'
elseif isdirectory('C:\Python310')
    let &pythonthreehome = 'C:\Python310'
    let &pythonthreedll = 'C:\Python310\python310.dll'
endif

" === Tags (укажи свой путь к ctags) ===
if isdirectory('C:\Progs\ctags')
    let g:easytags_cmd = 'C:\Progs\ctags\ctags.exe'
    let g:tagbar_ctags_bin = 'C:\Progs\ctags\ctags.exe'
    let g:tagbar_use_cache = 0
elseif executable('ctags')
    let g:tagbar_ctags_bin = 'C:/Users/belousov/Progs/ctags/ctags.exe'
    let g:easytags_cmd = 'ctags'
    " let g:tagbar_ctags_bin = 'ctags'
endif


" === ALE Python ===
" Укажи путь если autopep8 не в PATH
" let g:ale_python_autopep8_executable = 'C:\Python310\Scripts\autopep8.exe'
" let g:ale_python_autopep8_use_global = 1

" === Wiki paths (ИЗМЕНИ НА СВОИ!) ===
let g:wiki_path = expand('~/Documents/vimwiki/tech.wiki')

" === Vimwiki ===
let g:vimwiki_list = [{'path': expand('~/Documents/vimwiki/tech.wiki/'),
                     \ 'syntax': 'default', 'ext': '.wiki'}]

" === Startify bookmarks ===
let g:startify_bookmarks = [expand('~/vimfiles/vimrc')]

" === Домашняя директория при старте ===
" Раскомментируй если нужно
" cd ~\Documents

" === Shell ===
" Для совместимости с плагинами используем cmd.exe
set shell=cmd.exe
set shellcmdflag=/c
set shellquote=
set shellxquote=

" === Browser для HTML preview ===
let g:browser_cmd = 'start chrome'

" === AsyncRun settings ===
let g:asyncrun_open = 6
let g:asyncrun_bell = 1

" === GUI font (для gvim/nvim-qt) ===
if g:is_gui
    " set guifont=Consolas:h11
    " Или если установлен Nerd Font:
    " set guifont=JetBrainsMono\ NF:h11
endif

" === Maximize window (gvim) ===
if g:is_gui && !g:is_nvim
    " Пробуем загрузить maximize.dll если есть
    if filereadable(g:vim_runtime . '/maximize.dll')
        " autocmd GUIEnter * call libcallnr(g:vim_runtime . '/maximize.dll', 'Maximize', 1)
    endif
endif

" === Fix для Temp директории в Neovim ===
if g:is_nvim
    " Neovim иногда создаёт странные пути для temp
    " let $TEMP = 'C:\Users\' . $USERNAME . '\AppData\Local\Temp'
endif

" ══════════════════════════════════════════════════════════════════════════════
" Автоматическое сохранение/восстановление раскладки и цветной курсор (Lua)
" ══════════════════════════════════════════════════════════════════════════════

if has('win32') && has('nvim')
lua << EOF
    local english_layout = "1033"
    local saved_layout = english_layout -- По умолчанию ставим английский

    -- Функция: сохраняем текущий язык перед выходом и форсируем английский
    _G.save_and_switch_to_english = function()
        -- vim.system работает напрямую с процессом без вызова cmd.exe, поэтому лагов нет
        local obj = vim.system({'im-select'}):wait()
        if obj.code == 0 then
            local current = vim.trim(obj.stdout)
            if current ~= "" then
                saved_layout = current
            end
        end
        vim.system({'im-select', english_layout})
    end

    -- Функция: возвращаем тот язык, который был активен в Insert режиме
    _G.restore_saved_layout = function()
        vim.system({'im-select', saved_layout})
        
        -- Динамически перекрашиваем курсор в зависимости от возвращаемого языка
        if saved_layout == "1049" then
            vim.cmd("highlight DynamicInsertCursor guibg=#FF5555 ctermbg=Red")   -- Яркий красный для русского
        else
            vim.cmd("highlight DynamicInsertCursor guibg=#50FA7B ctermbg=Green") -- Яркий зеленый для английского
        end
    end

    -- === Настройка цветного курсора для Windows Terminal ===
    vim.cmd("set termguicolors") -- Включаем поддержку True Color
    vim.cmd("highlight DynamicInsertCursor guibg=#50FA7B ctermbg=Green")
    
    -- Настраиваем guicursor: в Normal mode оставляем стандартный блок,
    -- а в Insert (i), Cmdline-insert (ci) и Visual-exclusive (ve) делаем тонкую вертикальную линию (ver25) нашего цвета
    -- n-v-c-sm: блок (Normal, Visual, Command)
    -- i-ci-ve: палочка толщиной 25% с нашим цветом (Insert)
    -- r-cr-o: горизонтальная линия (Replace)
    vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25-DynamicInsertCursor,r-cr-o:hor20"

    -- Регистрируем быстрые автокоманды Neovim
    local group = vim.api.nvim_create_augroup("ImSelectGroup", { clear = true })
    vim.api.nvim_create_autocmd("InsertLeave", {
        group = group,
        callback = _G.save_and_switch_to_english,
    })
    vim.api.nvim_create_autocmd("InsertEnter", {
        group = group,
        callback = _G.restore_saved_layout,
    })
EOF
    echom "Windows (Neovim): Fast Lua-based layout switching and dynamic cursor enabled"
endif
