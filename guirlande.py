#!/usr/bin/env python

from flask import Flask
from flask import request
from nanpy import SerialManager
from nanpy import ArduinoApi
import argparse
import time


parser = argparse.ArgumentParser(description='Guirlande')
parser.add_argument('--tty', metavar='/dev/ttyXXX', default='/dev/ttyACM0',
                    help='TTY to use')

args = parser.parse_args()

connection = SerialManager(device=args.tty)
a = ArduinoApi(connection=connection)

RED = 3
GREEN = 5
BLUE = 6

app = Flask(__name__)


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


def fullBlink():
    setColor(10, 0, 0)
    time.sleep(0.2)
    setColor(0, 10, 0)
    time.sleep(0.2)
    setColor(0, 0, 10)
    time.sleep(0.2)


@app.route("/", methods=['POST'])
def blink():
    setColor(request.form.get('red'), request.form.get('green'), request.form.get('blue'))
    return "OK"


if __name__ == "__main__":
    init()
    setColor(1, 1, 1)
    app.run(host='0.0.0.0', port=8080)
