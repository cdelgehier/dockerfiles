# Build:
#   docker build -t cdelgehier/xrectsel .
#
FROM debian:jessie
MAINTAINER Cedric DELGEHIER <cedric.delgehier@laposte.net>

RUN apt-get update && apt-get install -y --no-install-recommends \
	autoconf automake build-essential git libx11-dev x11-utils ca-certificates

WORKDIR /tmp
RUN git clone https://github.com/lolilolicon/xrectsel.git 
WORKDIR /tmp/xrectsel 
RUN ./bootstrap \
	&& ./configure --prefix /usr \
	&& make \
	&& make DESTDIR="$directory" install


CMD ["/usr/bin/xrectsel"]
ENTRYPOINT ["/usr/bin/xrectsel"]
