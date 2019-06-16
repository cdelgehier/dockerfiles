```
docker build -t cdelgehier/bionic_20171114:systemd_ssh .
docker run -d --cap-add SYS_ADMIN -v /sys/fs/cgroup:/sys/fs/cgroup:ro cdelgehier/bionic_20171114:systemd_ssh /sbin/init
```
