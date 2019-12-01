docker build -t cdelgehier/centos8:systemd_ssh .
docker run --detach --cap-add SYS_ADMIN --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro centos8:systemd_ssh /usr/lib/systemd/systemd
