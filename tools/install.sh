#!/bin/bash

# запуск строго как ./linux.sh или bash linux.sh
# из каталога
# Внимание!!! старые данные ~/.vim/ и .vim* будут удалены

echo "----------------------------------------"
echo "    Programms vor vim                   "
echo "----------------------------------------"

sudo apt-get install git
sudo apt-get install cmake
sudo apt-get install python-dev
sudo apt-get install ranger caca-utils highlight atool w3m poppler-utils mediainfo
pip install ranger-fm
ranger --copy-config=all

sudo apt-get install vim-gtk3

mkdir ~/.vim/tmp/backup > /dev/null 2>&1
mkdir ~/.vim/swapfiles > /dev/null 2>&1
mkdir ~/.vim/undodir > /dev/null 2>&1
echo "directories for swap and backup created"

"Это уже не нужно. Измени в .basic.vim ru.vim на jcuken-ru.vim.
"Гораздо удобнее  keymap вообще не показывать, чем делать его короче.
echo "----------------------------"
echo "     jecuken=>ru rename.    "
echo "----------------------------"
cd /usr/share/vim/vim82/keymap || exit
sudo mv russian-jcuken.vim ru.vim

echo "----------------------------"
echo ".vimrc for Linux"
echo "----------------------------"
echo

# удаление старого окружения
rm -rf ~/.vim/ ~/.vim*
rm -rf ~/.vim_runtime/
echo "*** Old environment removed"
echo

# установка Vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo
echo "*** Vim-plug installed"
echo


# установка LiveDown
# livedown=$(npm -g ls | grep livedown | wc -l)
# if [ $livedown != "1"  ]
# then
# 	npm install -g livedown
# fi
# echo "*** LiveDown installed"
# echo


# словарь проверки орфографии - (только RU UTF-8)
mkdir ~/.vim/spell
cd ~/.vim/spell/ || exit
curl -O http://ftp.vim.org/vim/runtime/spell/ru.utf-8.sug
curl -O http://ftp.vim.org/vim/runtime/spell/ru.utf-8.spl
cd ~/    || exit
echo
echo "*** Dictionary installed"
echo




echo "----------------------------"
echo ".vimrc for Linux"
echo "----------------------------"

git clone https://github.com/idopshik/vimrc-s ~/.vim_runtime/

TODO надо первые 20 строк
# копирование .vimrc
cp /home/st/.vim_runtime/vimrcs/vimrc_memo  ~/.vimrc
echo "*** .vimrc copied"
echo


git clone https://github.com/powerline/fonts.git --depth=1
cd fonts     || exit
./install.sh
cd ..    || exit
rm -rf fonts


echo "----------------------------"
echo "fuzzyfinder"
echo "----------------------------"

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sudo apt-get install wmctrl


echo
echo "fzf .bashrc integration"
echo "vi - norc alias"
echo "vimwiki from bash by n<CR> "
echo
cat ~/.vim_runtime/vimrcs/tools/bashrc_lines >> ~/.bashrc

echo
echo "git_aliases to .gitconfig"
echo
cat git_aliases >> ~/.gitconfig


echo "----------------------------"
echo "   linters"
echo "----------------------------"

sudo apt-get install flake8
sudo apt-get install mypy
sudo apt-get install pylint
sudo apt-get install pydocstyle

echo "----------------------------"
echo "  тут возможен косяк.       "
echo "----------------------------"

sudo apt-get install npm

sudo npm install -g jshint
