# Build:
#   docker build -t cdelgehier/byzanz .
#
FROM alpine:3.3
MAINTAINER Cedric DELGEHIER <cedric.delgehier@laposte.net

RUN apk update && apk upgrade && apk add \
	git wget make automake autoconf gcc \
	libtool libc-dev gtk+3.0-dev gst-plugins-base1-dev mesa-gl

# gnome-common
WORKDIR /tmp
RUN git clone https://github.com/GNOME/gnome-common.git \
	&& cd gnome-common \
	&& ./autogen.sh && make && make install

# byzanz
WORKDIR /tmp/
#RUN git clone https://github.com/GNOME/byzanz.git \
RUN git clone https://github.com/alepez/byzanz.git byzanz-git\
	&& cd byzanz-git \
	&& ./autogen.sh --prefix=/usr && make && make install 

#RUN apk add alpine-sdk
ENV OUTPUT /tmp/byzanz
RUN mkdir $OUTPUT
WORKDIR $OUTPUT 

CMD ["/usr/bin/byzanz-record"]
ENTRYPOINT ["/usr/bin/byzanz-record"]
