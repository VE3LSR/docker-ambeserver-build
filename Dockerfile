FROM phusion/baseimage
MAINTAINER projects@ve3lsr.ca

RUN apt-get update && apt-get install -yq git build-essential pkg-config libusb-1.0-0-dev libwxgtk3.0-dev libasound2-dev debhelper autotools-dev  && apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

WORKDIR /opt/

# RUN git clone https://github.com/dl5di/OpenDV.git
RUN git clone https://github.com/coolacid/OpenDV.git

WORKDIR /opt/OpenDV/DummyRepeater

ADD copy.sh /opt

RUN ./configure --with-ambeserver

RUN dpkg-buildpackage -b -uc -j2

# RUN make
