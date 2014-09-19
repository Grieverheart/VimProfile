#!/bin/sh

echo === Checking out vundle
git submodule update --init
cd -

echo === Linking vim directories
ln -s $PWD/.vimrc $HOME/.vimrc
ln -s $PWD $HOME/.vim

echo === Linking tmux configuration
ln -s $PWD/.tmux.conf $HOME/.tmux.conf

echo === Vundling
vim +BundleInstall +qall

echo === Done
