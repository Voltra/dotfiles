#!/bin/bash

which clang || (wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add - && sudo apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-6.0 main" && sudo apt update && sudo apt-get install -y clang clang-format clang-tidy clang-tools)
