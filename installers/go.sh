#!/bin/bash

go --version || (sudo add-apt-repository ppa:longsleep/golang-backports && sudo apt upate && sudo apt install -y golang-go)
