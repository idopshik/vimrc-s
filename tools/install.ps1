# install.ps1 — Установка vim_unified конфигурации для Windows
# ══════════════════════════════════════════════════════════════════════════════
# Запуск: .\install.ps1
# ══════════════════════════════════════════════════════════════════════════════

$ErrorActionPreference = "Stop"

Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "       Установка unified vim/neovim конфигурации (Windows)" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# Пути
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$TargetDir = "$env:USERPROFILE\.vim_runtime"
$VimFilesDir = "$env:USERPROFILE\vimfiles"
$NvimConfigDir = "$env:LOCALAPPDATA\nvim"

Write-Host "Исходная директория: " -NoNewline -ForegroundColor Yellow
Write-Host $ScriptDir
Write-Host "Целевая директория:  " -NoNewline -ForegroundColor Yellow
Write-Host $TargetDir
Write-Host ""

# Бэкап существующей конфигурации
if (Test-Path $TargetDir) {
    $BackupDir = "$TargetDir.backup.$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    Write-Host "Существующая конфигурация найдена!" -ForegroundColor Yellow
    Write-Host "Создаю бэкап в: $BackupDir"
    Move-Item $TargetDir $BackupDir
}

# Копируем конфигурацию
Write-Host ""
Write-Host "Копирую конфигурацию..."
Copy-Item -Path $ScriptDir -Destination $TargetDir -Recurse

# Создаём директории для backup/swap/undo
Write-Host "Создаю директории..."
$Dirs = @(
    "$env:USERPROFILE\_vim\backup",
    "$env:USERPROFILE\_vim\swapfiles",
    "$env:USERPROFILE\_vim\undodir"
)
foreach ($Dir in $Dirs) {
    if (-not (Test-Path $Dir)) {
        New-Item -ItemType Directory -Path $Dir -Force | Out-Null
    }
}

# vimfiles структура
if (-not (Test-Path $VimFilesDir)) {
    New-Item -ItemType Directory -Path $VimFilesDir -Force | Out-Null
}

# Создаём _vimrc
Write-Host ""
Write-Host "Настраиваю точки входа..."

$VimrcPath = "$env:USERPROFILE\_vimrc"
if (Test-Path $VimrcPath) {
    $BackupVimrc = "$VimrcPath.backup.$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    Move-Item $VimrcPath $BackupVimrc
    Write-Host "Существующий _vimrc сохранён как бэкап" -ForegroundColor Yellow
}
Copy-Item "$TargetDir\vimrc" $VimrcPath
Write-Host "✓ " -NoNewline -ForegroundColor Green
Write-Host "_vimrc создан"

# Neovim init.vim
if (-not (Test-Path $NvimConfigDir)) {
    New-Item -ItemType Directory -Path $NvimConfigDir -Force | Out-Null
}

$NvimInitPath = "$NvimConfigDir\init.vim"
if (Test-Path $NvimInitPath) {
    $BackupInit = "$NvimInitPath.backup.$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    Move-Item $NvimInitPath $BackupInit
    Write-Host "Существующий init.vim сохранён как бэкап" -ForegroundColor Yellow
}
Copy-Item "$TargetDir\init.vim" $NvimInitPath
Write-Host "✓ " -NoNewline -ForegroundColor Green
Write-Host "init.vim создан в $NvimConfigDir"

# Создаём local.vim если не существует
$LocalVimPath = "$TargetDir\local.vim"
if (-not (Test-Path $LocalVimPath)) {
    @"
" local.vim — Локальные настройки (не в git)
" ══════════════════════════════════════════════════════════════════════════════
" Этот файл для machine-specific настроек

" Пример: путь к Python
" let &pythonthreehome = 'C:\Python312'
" let &pythonthreedll = 'C:\Python312\python312.dll'

" Пример: путь к ctags
" let g:tagbar_ctags_bin = 'C:\tools\ctags\ctags.exe'

" Пример: путь к wiki (ИЗМЕНИ!)
" let g:wiki_path = 'C:\Users\YourName\Documents\vimwiki'

" Пример: colorscheme
" colorscheme nord
"@ | Out-File -FilePath $LocalVimPath -Encoding utf8
    Write-Host "✓ " -NoNewline -ForegroundColor Green
    Write-Host "Создан local.vim"
}

# Установка vim-plug
Write-Host ""
Write-Host "Проверяю vim-plug..."

$VimPlugPath = "$VimFilesDir\autoload\plug.vim"
if (-not (Test-Path $VimPlugPath)) {
    Write-Host "Устанавливаю vim-plug для Vim..."
    $PlugDir = Split-Path $VimPlugPath
    if (-not (Test-Path $PlugDir)) {
        New-Item -ItemType Directory -Path $PlugDir -Force | Out-Null
    }
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" -OutFile $VimPlugPath
    Write-Host "✓ " -NoNewline -ForegroundColor Green
    Write-Host "vim-plug установлен"
} else {
    Write-Host "✓ " -NoNewline -ForegroundColor Green
    Write-Host "vim-plug уже установлен"
}

# vim-plug для Neovim
$NvimPlugPath = "$env:LOCALAPPDATA\nvim-data\site\autoload\plug.vim"
if (-not (Test-Path $NvimPlugPath)) {
    Write-Host "Устанавливаю vim-plug для Neovim..."
    $NvimPlugDir = Split-Path $NvimPlugPath
    if (-not (Test-Path $NvimPlugDir)) {
        New-Item -ItemType Directory -Path $NvimPlugDir -Force | Out-Null
    }
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" -OutFile $NvimPlugPath
    Write-Host "✓ " -NoNewline -ForegroundColor Green
    Write-Host "vim-plug для Neovim установлен"
} else {
    Write-Host "✓ " -NoNewline -ForegroundColor Green
    Write-Host "vim-plug для Neovim уже установлен"
}

Write-Host ""
Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "Установка завершена!" -ForegroundColor Green
Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
Write-Host "Следующие шаги:"
Write-Host "  1. Открой vim/nvim и выполни :PlugInstall"
Write-Host "  2. Проверь :SammelnInfo для информации об окружении"
Write-Host "  3. Отредактируй $TargetDir\local.vim"
Write-Host ""
Write-Host "ВАЖНО: Отредактируй local.vim и укажи:"
Write-Host "  - Путь к Python (pythonthreehome/pythonthreedll)"
Write-Host "  - Путь к ctags"
Write-Host "  - Путь к vimwiki"
Write-Host ""
Write-Host "Keymaps НЕ изменились:" -ForegroundColor Yellow
Write-Host "  <C-p>     — поиск файлов (FZF)"
Write-Host "  <C-n>     — NERDTree toggle"
Write-Host "  <F9>      — Tagbar toggle"
Write-Host "  <leader>  — запятая (,)"
Write-Host ""
