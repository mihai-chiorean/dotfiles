#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform        
    /usr/local/bin/brew update
    /usr/local/bin/brew upgrade `cat packages.txt`
    /usr/local/bin/brew install --dry-run `cat packages.txt`
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platformi
    echo 'install.sh: linux'
fi

pip install flake8
