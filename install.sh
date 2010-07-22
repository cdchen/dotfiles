#!/bin/bash

function abspath() { echo `pwd`/$1; }

ln -s `abspath zsh/zshrc` ~/.zshrc
ln -s `abspath zsh/zshrc.local` ~/.zshrc.local

ln -s `abspath vim` ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

ln -s `abspath vimperator/vimperatorrc` ~/.vimperatorrc
ln -s `abspath vimperator/vimperatorrc.local` ~/.vimperatorrc.local
