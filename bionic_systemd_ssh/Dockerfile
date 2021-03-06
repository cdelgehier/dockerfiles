FROM ubuntu:bionic-20171114 
MAINTAINER Cedric DELGEHIER <cedric.delgehier@laposte.net>

ENV container docker

# Install Ansible
RUN \
    (cd /lib/systemd/system/sysinit.target.wants/ || exit; for i in *; do [ "$i" = systemd-tmpfiles-setup.service ] || rm -f "$i"; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*; \
    rm -f /etc/systemd/system/*.wants/*; \
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*; \
    rm -f /lib/systemd/system/anaconda.target.wants/*; \
    apt update; \
    apt install -y openssh-server iproute2 rsyslog sudo iputils-ping python-minimal; \
    : Can't log kernel messages unless we're privileged; \
    sed -i 's/^\(module(load="imklog")\)/#\1/' /etc/rsyslog.conf
RUN yes y | ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN yes y | ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N ''
RUN mkdir /var/run/sshd
RUN echo 'root:ubuntu' | chpasswd
RUN useradd ubuntu -G sudo -s /bin/bash -m
RUN echo 'ubuntu:ubuntu' | chpasswd
RUN echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
ADD authorized_keys /root/.ssh/authorized_keys
ADD authorized_keys /home/ubuntu/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys
RUN chmod 600 /home/ubuntu/.ssh/authorized_keys
RUN chown ubuntu:  /home/ubuntu/.ssh/authorized_keys
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

VOLUME ["/sys/fs/cgroup"]
CMD ["/sbin/init"]
