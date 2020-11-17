#!/bin/bash

intensity=${1-255}
speed=${2-5}

while [ 1 ]; do
    for i in $(seq 0 $speed $intensity) ; do
        curl --data "red=$i&green=$i&blue=$i" http://127.0.0.1:8080/ >/dev/null 2>&1
    done
    for i in $(seq 0 $speed $intensity) ; do
        v=$(($intensity-$i))
        curl --data "red=$v&green=$v&blue=$v" http://127.0.0.1:8080/ >/dev/null 2>&1
    done
done
