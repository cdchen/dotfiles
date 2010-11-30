#!/bin/bash

if ! which python > /dev/null
then
    echo "Installing python ..."
    sudo aptitude install python
fi

if ! which easy_install > /dev/null
then
    echo "Installing python-setuptools ..."
    sudo aptitude install python-setuptools
fi

if ! which pip > /dev/null
then
    echo "Installing pip ..."
    sudo easy_install pip
fi

if ! python -c "import Image" > /dev/null
then
    echo "Installing python-imaging ..."
    sudo aptitude install python-imaging
fi

if ! which ipython > /dev/null
then
    echo "Installing ipython ..."
    sudo pip install ipython
fi

if ! python -c "import ipdb" > /dev/null
then
    echo "Installing ipdb ..."
    sudo pip install ipdb
fi

if ! which virtualenv > /dev/null
then
    echo "Installing virtualenv ..."
    sudo pip install virtualenv
fi

if ! which mkvirtualenv > /dev/null
then
    echo "Installing virtualenvwrapper ..."
    sudo pip install virtualenvwrapper
fi
