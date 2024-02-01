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
mkdir /tmp/output
docker run -it --rm -v /tmp/output:/output pico-firmware-builder
```
On the /tmp/output folder you will find the firmware:
```shell
ll /tmp/output/build-RPI_PICO/
total 13064
drwxr-xr-x 9 root root      4096 févr.  1 21:38 ./
drwxr-xr-x 3 pi   docker    4096 févr.  1 21:38 ../
-rw-r--r-- 1 root root     20005 févr.  1 21:38 CMakeCache.txt
drwxr-xr-x 9 root root      4096 févr.  1 21:38 CMakeFiles/
-rw-r--r-- 1 root root      1705 févr.  1 21:38 cmake_install.cmake
drwxr-xr-x 6 root root      4096 févr.  1 21:38 elf2uf2/
-rwxr-xr-x 1 root root    327336 févr.  1 21:38 firmware.bin*
-rw-r--r-- 1 root root   4722730 févr.  1 21:38 firmware.dis
-rwxr-xr-x 1 root root   4143388 févr.  1 21:38 firmware.elf*
-rw-r--r-- 1 root root   1568608 févr.  1 21:38 firmware.elf.map
-rw-r--r-- 1 root root    920771 févr.  1 21:38 firmware.hex
-rw-r--r-- 1 root root    654848 févr.  1 21:38 firmware.uf2
-rw-r--r-- 1 root root    404807 févr.  1 21:38 frozen_content.c
drwxr-xr-x 3 root root      4096 févr.  1 21:38 frozen_mpy/
drwxr-xr-x 3 root root      4096 févr.  1 21:38 generated/
drwxr-xr-x 5 root root      4096 févr.  1 21:38 genhdr/
-rw-r--r-- 1 root root    541370 févr.  1 21:38 Makefile
drwxr-xr-x 6 root root      4096 févr.  1 21:38 pico-sdk/
-rw-r--r-- 1 root root     18469 févr.  1 21:38 pins_RPI_PICO.c
drwxr-xr-x 6 root root      4096 févr.  1 21:38 submodules/
```