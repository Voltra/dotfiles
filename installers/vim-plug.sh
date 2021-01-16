#!/bin/bash

repo="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

mkdir -p ~/.vim/autoload ~/.config/nvim/autoload &> /dev/null

[ -f ~/.vim/autoload/plug.vim ] || curl -fLo ~/.vim/autoload/plug.vim --create-dirs $repo 
[ -f ~/.config/nvim/autoload/plug.vim ] || curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs $repo 
