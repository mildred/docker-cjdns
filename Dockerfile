FROM debian:stable
MAINTAINER mildred

RUN { \
  export DEBIAN_FRONTEND=noninteractive; \
  apt-get update; \
  apt-get install -y git build-essential curl python; \
  mkdir -p /usr/src; \
  git clone https://github.com/cjdelisle/cjdns.git /usr/src/cjdns; \
  cd /usr/src/cjdns; \
  : git checkout -f $(git describe --abbrev=0 --tags --always); \
  ./do; \
  install -m755 -oroot -groot /usr/src/cjdns/cjdroute /usr/bin/cjdroute; \
  mkdir -p /etc/cjdns; \
  apt-get remove -y build-essential curl; \
  apt-get autoremove; \
  apt-get clean; \
}

COPY entry.sh /entry.sh
VOLUME /etc/cjdns
ENTRYPOINT ["/bin/bash", "/entry.sh"]
CMD ["cjdroute", "--nobg"]
