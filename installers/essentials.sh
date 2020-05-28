#!/bin/bash

which gcc || sudo apt install build-essential
jq -v || sudo apt install jq
which vim || sudo apt install vim
python3 -v || sudo apt install python3-dev
which cmake || sudo apt install cmake

