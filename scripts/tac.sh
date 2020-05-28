#!/bin/bash

grep -n "" "$@" | sort -r -n | sed 's/^[0-9]*://g'
