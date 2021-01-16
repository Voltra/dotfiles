#!/bin/bash

which nvim &> /dev/null
if [ $? -ne 0 ]; then
	sudo add-apt-repository ppa:neovim-ppa/unstable
	sudo apt install neovim
fi

