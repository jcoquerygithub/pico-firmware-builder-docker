#!/usr/bin/env bash
cd /pico
git clone -b master https://github.com/micropython/micropython.git --branch master
git clone -b master https://github.com/raspberrypi/picotool.git --branch master
cd /pico/micropython
git submodule update --init -- lib/pico-sdk lib/tinyusb lib/mbedtls
make -C mpy-cross
make -C ports/rp2 BOARD=RPI_PICO_W submodules


mkdir /pico/picotool/build
cd /pico/picotool/build
export PICO_SDK_PATH=/pico/micropython/lib/pico-sdk
cmake ../ && make
export PATH=/pico/picotool/build:$PATH

cd /pico/micropython/ports/rp2
sed -i 's/#define MICROPY_HW_ENABLE_UART_REPL.*/#define MICROPY_HW_ENABLE_UART_REPL (1) \/\/ useful if there is no USB/' mpconfigport.h
make BOARD=RPI_PICO_W
cp -r /pico/micropython/ports/rp2/build-RPI_PICO /output