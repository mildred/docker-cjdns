docker-cjdns
============

Installation is simple. On first run, cjdns will generate your IP
address. The cjdns configuration lies in `/etc/cjdns` (which is a
docker volume).

To be useful you'll have to run this in privileged mode, with the
same network stack as the host. This can be acomplished using the
docker options `--privileged --net=host`.

    docker pull mildred/cjdns
    docker run --privileged --net=host mildred/cjdns --volume /etc/cjdns:/etc/cjdns
