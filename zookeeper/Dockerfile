# Build:
# docker build -t cdelgehier/zookeeper .
#
FROM jeanblanchard/java:jre-8
#FROM java:8-jre-alpine
MAINTAINER Cedric DELGEHIER <cedric.delgehier@laposte.net>

ENV APACHE_MIRROR=https://www.apache.org/dist
ENV VERSION=3.4.8
ENV JRE_VERS=7
#ENV JAVA_HOME=/usr/lib/jvm/default-jvm
ENV JAVA_HOME=/opt/jre

RUN 	apk add --update \
		--virtual=build-dependencies  wget \
	&& apk add bash \
	&& cd /tmp \
	&& wget -q --no-check-certificate $APACHE_MIRROR/zookeeper/zookeeper-$VERSION/zookeeper-$VERSION.tar.gz \
	&& tar -xzf zookeeper-$VERSION.tar.gz -C /opt \
	&& ln -s /opt/zookeeper-$VERSION /opt/zookeeper \
	&& apk del build-dependencies \
	&& rm -rf /tmp/* \
	&& rm -rf /var/cache/apk/* \
	&& mkdir /var/log/zookeeper \
	&& cd /var/log/zookeeper

EXPOSE 2181 2888 3888
VOLUME ["/var/lib/zookeeper", "/var/log/zookeeper"]

ADD ./run.sh /run.sh
ENTRYPOINT ["/run.sh"]
