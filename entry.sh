#!/bin/bash

if ! [ -e /etc/cjdns/cjdroute.conf ]; then
  echo -n "Generate /etc/cjdns/cjdroute.conf... "
  (
    umask 077
    ./cjdroute --genconf >/etc/cjdns/cjdroute.conf
  )
  echo "ok"
fi

exec </etc/cjdns/cjdroute.conf

exec "$@"

