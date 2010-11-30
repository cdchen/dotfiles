#!/bin/bash

if [ ! -e /bin/zsh ]
then
    echo "Installing zsh ..."
    sudo aptitude install zsh
fi

echo "Making zsh the default for user `whoami` ..."
sudo chsh `whoami` -s /bin/zsh
