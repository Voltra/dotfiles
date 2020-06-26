#!/bin/bash

tree --version || sudo apt install -y tree
git --version || (sudo apt install -y git && git config core.autocrlf true)
git flow version || sudo apt install -y git-flow
gcc --version || sudo apt install -y build-essential
jq --help || sudo apt install -y jq
vim --help || sudo apt install -y vim
python3 --version || sudo apt install -y python3-dev python3-pip
pip3 --version || sudo apt install -y python3-pip
cmake --version || sudo apt install -y cmake
wget --help || sudo apt install -y wget
curl --version || sudo apt install -y curl
update-ca-certificates --version || sudo apt install -y ca-certificates
gpg --version || sudo apt install -y gnupg gnupg-agent
which tclsh || sudo apt install -y tcl
openssl version || sudo apt install -y openssl libssl-dev
pkg-config --version || sudo apt install -y pkg-config
dpkg -l apt-transport-https || sudo apt install -y apt-transport-https
dpkg -l software-properties-common || sudo apt install -y software-properties-common
powerline-daemon --replace -q || (sudo apt install -y powerline fonts-powerline && fc-cache -vf)

[ -d ~/.vim ] || mkdir -p ~/.vim/undodir
