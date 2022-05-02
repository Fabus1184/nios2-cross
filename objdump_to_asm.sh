#!/bin/bash

set -e

[[ -z $1 ]] && exit 1

sed -i "s/\t[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]//g" $1
sed -ri "s/<.+\+0x[0-9a-f]+>$//g" $1
