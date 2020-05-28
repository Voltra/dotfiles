#!/bin/bash

ansible --version || (sudo apt-add-repository --yes --update ppa:ansible/ansible && sudo apt update && sudo apt install -y ansible)
