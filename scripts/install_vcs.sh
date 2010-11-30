#!/bin/bash

if ! which git
then
    sudo aptitude install git-core
fi
if ! git help svn > /dev/null
then
    sudo aptitude install git-svn
fi

if ! which bzr
then
    sudo aptitude install bzr
fi

if ! which svn
then
    sudo aptitude install subversion
fi

if ! which hg
then
    sudo aptitude install mercurial
fi
