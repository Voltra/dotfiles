#!/bin/bash

which redis || (sudo add-apt-repository ppa:chris-lea/redis-server && sudo apt update && sudo apt install -y redis redis-server php-redis)
