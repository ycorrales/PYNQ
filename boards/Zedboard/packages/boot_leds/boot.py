#!/bin/env python3.10

from time import sleep
from pynq.overlays.base import BaseOverlay

base = BaseOverlay("Zedboard.bit")

# rgbleds = [base.rgbleds[i] for i in range(4, 6)]
leds = [base.leds[i] for i in range(4)]

# Toggle board LEDs leaving small LEDs lit
for i in range(8):
    [led.off() for led in leds]
    #     [rgbled.off() for rgbled in rgbleds]
    sleep(0.2)
    [led.on() for led in leds]
    #     [rgbled.on(1) for rgbled in rgbleds]
    sleep(0.2)

# [rgbled.off() for rgbled in rgbleds]
