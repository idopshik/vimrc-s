#!/bin/bash

# запуск строго как ./linux.sh или bash linux.sh
# из каталога
# Внимание!!! старые данные ~/.vim/ и .vim* будут удалены
set -e

if [ ! -n "$Vim_RCs" ]; then
  Vim_RCs=~/.vim_runtime/vimrcs/
fi

if [ -d "$Vim_RCs" ]; then
        echo "You already have Vim installed"
        echo "You'll need to remove $Vim_RCs if you want to reinstall your settings"
  exit
fi

echo "Cloning Vimrc's.."
hash git >/dev/null 2>&1 && /usr/bin/env git clone https://github.com/idopshik/vimrc-s  $Vim_RCs || {
  echo "git not installed"
  exit
}

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

#Это АРХИважно. Потому что в штатном jecuken точка и запятая на цифрах. Я так не привык!
echo "----------------------------"
echo "     ru.vim    "
echo "----------------------------"
sudo cp -TRv /home/st/Dropbox/Linux_or_Vim_related/vim_savings/put_it_it_keymap_folder/ru.vim /usr/share/vim/vim82/keymap

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


# копирование .vimrc
echo "source ~/.vim_runtime/vimrcs/sammeln.vim" > ~/.vimrc
echo "*** .vimrc created"
echo


echo "----------------------------"
echo "custome Folds files"
echo "----------------------------"
#Это точно рабочая команда!
cp -TRv /home/st/Dropbox/Linux_or_Vim_related/vim_savings/after/ ~/.vim/after/


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
echo "My DOTFILES"
echo "Cloning Dotfiles.."
hash git >/dev/null 2>&1 && /usr/bin/env git clone https://github.com/idopshik/dotfiles  $HOME || {
  echo "dotfiles not installed"
  echo
  echo "Don't forget to run -  createLink.sh  - and prabably give rights for that firstly"
  echo
  exit
}

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

echo "----------------------------"
echo "   боль с клавиатурой       "
echo "----------------------------"
