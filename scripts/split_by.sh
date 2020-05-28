#!/bin/bash

function usage {
        echo "split_by <separator> <string>"
        echo -e "\t e.g. echo \$var | split_by :"
}


if (( $# < 1 )); then
        usage
        exit 1
fi

sed s/$1/\\n/g $2
