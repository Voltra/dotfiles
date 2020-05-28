#!/bin/bash

pushd ~/.vim/plugged/YouCompleteMe && (./install.py $@ ; popd)
