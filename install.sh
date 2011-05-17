#!/bin/bash

function abspath() { echo `pwd`/$1; }

ln -s `abspath zsh/zshrc` ~/.zshrc
ln -s `abspath zsh/zshrc.local` ~/.zshrc.local

ln -s `abspath vim` ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

ln -s `abspath gitignore` ~/.gitignore
ln -s `abspath gitconfig` ~/.gitconfig

ln -s `abspath pentadactyl/pentadactylrc` ~/.pentadactylrc
ln -s `abspath pentadactyl/pentadactylrc.local` ~/.pentadactylrc.local

test ! -e ~/.vim/sessions && mkdir ~/.vim/sessions
touch ~/.vim_spinner_mru_files
