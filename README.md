# pico-firmware-builder-docker

This repo holds Dockerfile to create a builder image to be run on, for exemple, a pi4. The image contains then a script to make pico w firmware.

## Options included
The very first usage I had was to include the support of REPL over UART. see [python sdk section 2.2](https://datasheets.raspberrypi.com/pico/raspberry-pi-pico-python-sdk.pdf)
```c
#define MICROPY_HW_ENABLE_UART_REPL (1)
```

## Command line for building image
From the pi4 (or other):
```shell
git clone https://github.com/jcoquerygithub/pico-firmware-builder-docker.git
docker build -t pico-firmware-builder pico-firmware-builder-docker

```
