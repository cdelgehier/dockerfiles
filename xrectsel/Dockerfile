# Build:
#   docker build -t cdelgehier/xrectsel .
#
FROM alpine:3.3
MAINTAINER Cedric DELGEHIER <cedric.delgehier@laposte.net>

RUN apk update && apk upgrade && apk add \
	git autoconf automake make gcc \
	libc-dev libx11-dev  

# xrectsel
WORKDIR /tmp/
RUN git clone https://github.com/lolilolicon/xrectsel.git \
	&& cd xrectsel \
	&& ./bootstrap &&  ./configure --prefix=/usr && make && make install 

CMD ["/usr/bin/xrectsel"]
ENTRYPOINT ["/usr/bin/xrectsel"]
