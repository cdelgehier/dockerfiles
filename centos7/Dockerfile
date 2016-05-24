# Build:
#   docker build -t cdelgehier/centos7 .
#
FROM centos:7
MAINTAINER Cedric DELGEHIER <cedric.delgehier@laposte.net>

ENV LANG fr_FR.UTF-8
ENV container docker

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/* \
    && rm -f /etc/yum.repos.d/* \
    && rm -f /etc/localtime \
    && ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime \
    && localedef -i fr_FR -f UTF-8 fr_FR.UTF-8 \
    && yum install -y curl tar wget net-tools vim \
    && yum clean all \
    && rm -rf /tmp/*

COPY ./bashrc /etc/bashrc

VOLUME [ "/sys/fs/cgroup" ]

# Default command
CMD ["/bin/bash"]
