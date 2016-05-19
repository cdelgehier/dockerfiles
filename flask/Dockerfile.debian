# Build:
#   docker build -t cdelgehier/flask .
#
FROM debian:jessie
MAINTAINER Cedric DELGEHIER <cedric.delgehier@laposte.net
#FROM python:2.7
ENV IP 0.0.0.0
ENV PORT 5000
ENV APP_FILE hello.py

RUN apt-get update && apt-get install -y \
	python3 python3-pip 
RUN pip3 install Flask Flask-Script

RUN mkdir /APP
WORKDIR /APP

COPY $APP_FILE /APP/

EXPOSE $PORT

CMD /usr/bin/python3
#ENTRYPOINT ["/usr/bin/python3", "hello.py", "runserver", "-h", $IP, "-p", $PORT, "-d"]
ENTRYPOINT /usr/bin/python3 $APP_FILE runserver -h $IP -p $PORT -d
