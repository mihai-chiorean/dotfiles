#!/usr/bin/env bash

git clone https://github.com/Lokaltog/vim-distinguished.git ~/vim-distinguished

mv ~/vim-distinguished/colors ~/.vim/colors

rm -Rf ~/vim-distinguished

mkdir -p ~/.vim/undo/ ~/.vim/spell ~/.vim/autoload

if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

vim +"PlugSnapshot! $HOME/.vim/snapshot.vim" +PlugUpgrade +PlugClean! +PlugUpdate +qa
