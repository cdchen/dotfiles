#!/bin/bash

if ! which python then
    sudo aptitude install python
fi

if ! which easy_install then
    sudo aptitude install python-setuptools
fi

if ! which pip then
    sudo easy_install pip
fi

if ! python -c "import Image" then
    sudo aptitude install python-imaging
fi

if ! which ipython then
    sudo pip install ipython
fi

if ! python -c "import ipdb" then
    sudo pip install ipdb
fi

if ! which virtualenv then
    sudo pip install virtualenv
fi

if ! which mkvirtualenv then
    sudo pip install virtualenvwrapper
fi
