#!/bin/bash

if [ ! -e /bin/zsh ] then
    sudo aptitude install zsh
fi

sudo chsh `whoami` -s /bin/zsh
