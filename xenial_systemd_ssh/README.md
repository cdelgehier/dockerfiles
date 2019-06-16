```
docker build -t cdelgehier/xenial_20151218:systemd_ssh .
docker run -d --cap-add SYS_ADMIN -v /sys/fs/cgroup:/sys/fs/cgroup:ro cdelgehier/xenial_20151218:systemd_ssh /sbin/init
```
