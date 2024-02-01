FROM python:3
LABEL authors="Jc Coquery"

# Install dependencies
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -q -y git cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential libusb-1.0-0-dev

WORKDIR /pico

ADD launch-build.sh /pico
RUN chmod +x /pico/launch-build.sh

ENTRYPOINT ["/pico/launch-build.sh"]