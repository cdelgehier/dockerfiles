# Build:
#   docker build -t cdelgehier/byzanz .
#
MAINTAINER Cedric DELGEHIER <cedric.delgehier@laposte.net
FROM debian:jessie

RUN apt-get update && apt-get install -y --no-install-recommends \
	byzanz

ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
	&& chown -R user:user $HOME
RUN mkdir /home/user/byzanz


WORKDIR $HOME
USER user
CMD ["/usr/bin/byzanz-record"]
ENTRYPOINT ["/usr/bin/byzanz-record"]
