# Build:
#   docker build -t cdelgehier/python3 .
#
FROM alpine:3.3
MAINTAINER Cedric DELGEHIER <cedric.delgehier@laposte.net>

RUN apk add --update --no-cache python3 \
	&& python3 -m ensurepip \
	&& rm -r /usr/lib/python*/ensurepip \
	&& pip3 install --upgrade pip setuptools \
	&& rm -rf /tmp/* /var/cache/apk/* /root/.cache

ENTRYPOINT ["python3"]
#CMD ["python3"]
