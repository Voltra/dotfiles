#!/bin/bash

git --version || sudo apt install -y git git-flow
git flow version || sudo apt install -y git-flow
which gcc || sudo apt install -y build-essential
jq --help || sudo apt install -y jq
which vim || sudo apt install -y vim
python3 --version || sudo apt install -y python3-dev python3-pip
pip3 --version || sudo apt install -y python3-pip
which cmake || sudo apt install -y cmake
which wget || sudo apt install -y wget
which curl || sudo apt install -y curl
which update-ca-certificates || sudo apt install -y ca-certificates
which gpg || sudo apt install -y gnupg
which tcl || sudo apt install -y tcl
which openssl || sudo apt install -y openssl libssl-dev
which pkg-config || sudo apt install -y pkg-config
