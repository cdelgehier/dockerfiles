# Build:
#   docker build -t cdelgehier/whereami .
#
FROM cdelgehier/flask
MAINTAINER Cedric DELGEHIER <cedric.delgehier@laposte.net>

ENV IP 0.0.0.0
ENV PORT 80
ENV APP_FILE whereami.py

RUN mkdir /APP 
RUN apk add --update \
	build-base python3-dev linux-headers\
	&& pip install netifaces \
	&& apk del build-base && rm -rf /tmp/* && rm -rf /var/cache/apk/*
WORKDIR /APP

COPY $APP_FILE /APP/

EXPOSE $PORT
ENTRYPOINT python3 $APP_FILE runserver -h $IP -p $PORT -d
