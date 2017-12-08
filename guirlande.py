#!/usr/bin/env python

from nanpy import SerialManager
from nanpy import ArduinoApi
connection = SerialManager(device='/dev/ttyACM0')
a = ArduinoApi(connection=connection)

RED=3
GREEN=5
BLUE=6

def init():
    a.pinMode(RED, a.OUTPUT)
    a.pinMode(GREEN, a.OUTPUT)
    a.pinMode(BLUE, a.OUTPUT)

def setColor(r, g, b):
    a.analogWrite(RED, r)
    a.analogWrite(GREEN, g)
    a.analogWrite(BLUE, b)

def red():
    setColor(255, 0, 0)

def green():
    setColor(0, 255, 0)

def blue():
    setColor(0, 0, 255)

setColor(255, 0, 0)
red()

