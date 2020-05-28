#!/bin/bash

which osqueryi || (export OSQUERY_KEY=1484120AC4E9F8A1A577AEEE97A80C63C9D8B80B && sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys $OSQUERY_KEY && sudo add-apt-repository 'deb [arch=amd64] https://pkg.osquery.io/deb deb main' && sudo apt update && sudo apt install osquery)
