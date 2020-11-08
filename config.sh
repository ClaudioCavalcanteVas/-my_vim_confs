#!/bin/bash

echo "================================================================================="
echo "= Vim configurations"
echo "---------------------------------------------------------------------------------"

echo "Installing dependencies and Plug for vim"

sudo apt install -y ack cmake curl && \
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Creating symlink for vimrc"

ln -s $(pwd)/vimrc ~/.vimrc

echo "Installing vim dependencies..."

 vim +PlugInstall +qall

