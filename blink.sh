#!/bin/bash

intensity=${1-255}

while [ 1 ]; do
curl --data "red=$intensity&green=0&blue=0" http://127.0.0.1:8080/ >/dev/null 2>&1
sleep 0.05
curl --data "red=0&green=$intensity&blue=0" http://127.0.0.1:8080/ >/dev/null 2>&1
sleep 0.05
curl --data "red=0&green=0&blue=$intensity" http://127.0.0.1:8080/ >/dev/null 2>&1
sleep 0.05
done
