# Build:
#   docker build -t cdelgehier/byzanz .
#
FROM alpine:3.3
MAINTAINER Cedric DELGEHIER <cedric.delgehier@laposte.net>

RUN apk add --update \
	build-base \
	--virtual=build-dependencies git make automake autoconf gcc libtool libc-dev mesa-gl gtk+3.0-dev gst-plugins-base1-dev\
	&& apk add gtk+3.0 gstreamer1-dev gst-plugins-base1\ 
	&& cd /tmp \
	&& git clone https://github.com/GNOME/gnome-common.git \
	&& cd gnome-common \
	&& ./autogen.sh && make && make install \
	&& cd /tmp \
	&& git clone https://github.com/alepez/byzanz.git byzanz-git \
	&& cd byzanz-git && ./autogen.sh --prefix=/usr && make && make install \
	&& apk del build-dependencies build-base && rm -rf /tmp/* && rm -rf /var/cache/apk/*


ENV OUTPUT /tmp/byzanz
RUN mkdir $OUTPUT
WORKDIR $OUTPUT 

CMD ["/usr/bin/byzanz-record"]
ENTRYPOINT ["/usr/bin/byzanz-record"]
