#!/bin/bash

function dellink() {
    if [ -L $1 ] ; then
        rm $1
    fi
}

dellink ~/.zshrc
dellink ~/.zshrc.local

dellink ~/.vim
dellink ~/.vimrc

dellink ~/.vimperatorrc
dellink ~/.vimperatorrc.local
