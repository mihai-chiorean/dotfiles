#!/usr/bin/env bash

git clone https://github.com/Lokaltog/vim-distinguished.git ~/vim-distinguished

if [ ! -f ~/.vim/colors ]; then
    mkdir -p ~/.vim/colors
fi
cp ~/vim-distinguished/colors/* ~/.vim/colors
echo "vim Colors copied"
rm -Rf ~/vim-distinguished

if [ ! -f ~/.vim/undo ]; then
    mkdir -p ~/.vim/undo/ 
fi
if [ ! -f ~/.vim/spell ]; then
    mkdir -p ~/.vim/spell 
fi
if [ ! -f ~/.vim/autoload ]; then
    mkdir -p ~/.vim/autoload
fi

if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Installing vim plugins..."$HOME
vim -es -V -T -S -u ~/.vimrc <<-EOF
    :PlugSnapshot! $HOME/.vim/snapshot.vim
    :PlugUpgrade
    :PlugClean!
    :PlugUpdate
		:update
EOF

echo "Done with vim plugins"
#vim -E -s +"PlugSnapshot! $HOME/.vim/snapshot.vim" +PlugUpgrade +PlugClean! +PlugUpdate +qall
