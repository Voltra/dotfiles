#!/bin/bash

which pgadmin || (wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - && sudo apt update && sudo apt install -y postgresql12 pgadmin4 postgresql-client-12 pgcli libpq-dev php-postgresql)
