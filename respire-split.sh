#!/bin/bash

intensity=${1-255}
speed=${2-5}

while [ 1 ]; do
    for i in $(seq 0 $speed $intensity) ; do
        curl --data "red=$i&green=0&blue=0" http://127.0.0.1:8080/ >/dev/null 2>&1
    done
    for i in $(seq 0 $speed $intensity) ; do
        v=$(($intensity-$i))
        curl --data "red=$v&green=0&blue=0" http://127.0.0.1:8080/ >/dev/null 2>&1
    done
    for i in $(seq 0 $speed $intensity) ; do
        curl --data "red=0&green=$i&blue=0" http://127.0.0.1:8080/ >/dev/null 2>&1
    done
    for i in $(seq 0 $speed $intensity) ; do
        v=$(($intensity-$i))
        curl --data "red=0&green=$v&blue=0" http://127.0.0.1:8080/ >/dev/null 2>&1
    done
    for i in $(seq 0 $speed $intensity) ; do
        curl --data "red=0&green=0&blue=$i" http://127.0.0.1:8080/ >/dev/null 2>&1
    done
    for i in $(seq 0 $speed $intensity) ; do
        v=$(($intensity-$i))
        curl --data "red=0&green=0&blue=$v" http://127.0.0.1:8080/ >/dev/null 2>&1
    done
done
